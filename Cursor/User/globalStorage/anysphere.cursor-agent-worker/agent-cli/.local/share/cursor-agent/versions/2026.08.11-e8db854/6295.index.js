exports.id=6295,exports.ids=[6295],exports.modules={"./src/commands/repaint-debug.ts"(e,t,s){"use strict";s.r(t),s.d(t,{handleRepaintDebug:()=>S});var o=s("node:fs"),n=s("node:http"),r=s("node:path"),a=s("node:url"),i=s("../../node_modules/.pnpm/@lydell+node-pty@1.1.0_patch_hash=8cc7c6b3b59e47c0436b0f2bbb89cec1ced0f8ac0beadc41a2d07016bef0ea46/node_modules/@lydell/node-pty/index.js"),l=s("../../node_modules/.pnpm/node-ansiparser@2.2.1/node_modules/node-ansiparser/dist/ansiparser.js"),c=s.n(l),d=s("./src/console-io.ts");function u(e,t,s){return Math.max(t,Math.min(s,e))}function h(e){const t=e.charCodeAt(0);return t>=0&&t<=31||127===t}function p(e,t,s){return`CSI ${e}${t}${s}`.trim()}function v(e,t,s){s<0||s>=t||e.add(s)}function w(e,t,s){return Math.max(t,Math.min(s,e))}function m(e){return Array.from({length:e},(()=>" "))}class f{constructor(e,t){this.rows=e,this.cols=t,this.cursorRow=0,this.cursorCol=0,this.savedCursor=null,this.cells=Array.from({length:e},(()=>m(t)))}getSnapshot(){return{rows:this.rows,cols:this.cols,cursorRow:this.cursorRow,cursorCol:this.cursorCol,lines:this.cells.map((e=>e.join("")))}}inst_p(e){for(const t of Array.from(e))this.writeChar(t)}inst_o(e){}inst_x(e){switch(e){case"\n":case"\v":case"\f":return void this.lineFeed();case"\r":return void(this.cursorCol=0);case"\b":return void(this.cursorCol=Math.max(0,this.cursorCol-1));case"\t":{const e=Math.min(this.cols-1,8*Math.floor(this.cursorCol/8)+8);return void(this.cursorCol=e)}default:return}}inst_c(e,t,s){var o,n;const r=null!==(o=t[0])&&void 0!==o?o:0,a=null!==(n=t[1])&&void 0!==n?n:0;switch(s){case"A":return void(this.cursorRow=w(this.cursorRow-Math.max(r,1),0,this.rows-1));case"B":return void(this.cursorRow=w(this.cursorRow+Math.max(r,1),0,this.rows-1));case"C":return void(this.cursorCol=w(this.cursorCol+Math.max(r,1),0,this.cols-1));case"D":return void(this.cursorCol=w(this.cursorCol-Math.max(r,1),0,this.cols-1));case"E":return this.cursorRow=w(this.cursorRow+Math.max(r,1),0,this.rows-1),void(this.cursorCol=0);case"F":return this.cursorRow=w(this.cursorRow-Math.max(r,1),0,this.rows-1),void(this.cursorCol=0);case"G":return void(this.cursorCol=w(Math.max(r,1)-1,0,this.cols-1));case"H":case"f":return this.cursorRow=w(Math.max(r,1)-1,0,this.rows-1),void(this.cursorCol=w(Math.max(a||1,1)-1,0,this.cols-1));case"J":return void this.eraseInDisplay(r);case"K":return void this.eraseInLine(r);case"m":default:case"h":case"l":return;case"s":return void this.saveCursor();case"u":return void this.restoreCursor()}}inst_e(e,t){switch(t){case"7":return void this.saveCursor();case"8":return void this.restoreCursor();case"D":return void this.lineFeed();case"M":return void this.reverseLineFeed();default:return}}inst_H(e,t,s){}inst_P(e){}inst_U(){}inst_E(){}writeChar(e){"\0"!==e&&(this.cursorRow<0||this.cursorRow>=this.rows||((this.cursorCol<0||this.cursorCol>=this.cols)&&(this.lineFeed(),this.cursorCol=0),this.cells[this.cursorRow][this.cursorCol]=e,this.cursorCol+=1,this.cursorCol>=this.cols&&(this.cursorCol=0,this.lineFeed())))}lineFeed(){if(this.cursorRow===this.rows-1)return this.cells.shift(),void this.cells.push(m(this.cols));this.cursorRow+=1}reverseLineFeed(){if(0===this.cursorRow)return this.cells.pop(),void this.cells.unshift(m(this.cols));this.cursorRow-=1}saveCursor(){this.savedCursor={row:this.cursorRow,col:this.cursorCol}}restoreCursor(){this.savedCursor&&(this.cursorRow=w(this.savedCursor.row,0,this.rows-1),this.cursorCol=w(this.savedCursor.col,0,this.cols-1))}eraseInDisplay(e){switch(e){case 0:this.eraseInLine(0);for(let e=this.cursorRow+1;e<this.rows;e++)this.clearRow(e);return;case 1:this.eraseInLine(1);for(let e=0;e<this.cursorRow;e++)this.clearRow(e);return;case 2:case 3:for(let e=0;e<this.rows;e++)this.clearRow(e);return this.cursorRow=0,void(this.cursorCol=0);default:return}}eraseInLine(e){const t=this.cells[this.cursorRow];switch(e){case 0:for(let e=this.cursorCol;e<this.cols;e++)t[e]=" ";return;case 1:for(let e=0;e<=this.cursorCol;e++)t[e]=" ";return;case 2:return void this.clearRow(this.cursorRow);default:return}}clearRow(e){this.cells[e]=m(this.cols)}}const g=String.raw`<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Agent CLI Repaint Debug</title>
    <style>
      :root {
        color-scheme: dark;
        --bg: #0a0a0a;
        --bg-elevated: #111111;
        --line: #252525;
        --text: #e8e8e8;
        --muted: #9a9a9a;
        --accent: #d0d0d0;
        --changed-rgb: 255, 255, 255;
      }

      * {
        box-sizing: border-box;
      }

      body {
        margin: 0;
        font-family:
          ui-sans-serif,
          -apple-system,
          BlinkMacSystemFont,
          "Segoe UI",
          sans-serif;
        background: var(--bg);
        color: var(--text);
      }

      .layout {
        display: grid;
        grid-template-columns: minmax(640px, 1.6fr) minmax(340px, 1fr);
        gap: 0;
        min-height: 100vh;
        padding: 0;
      }

      .panel-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 12px;
        padding: 12px 16px;
        border-bottom: 1px solid var(--line);
        background: var(--bg);
      }

      .panel-header h2 {
        font-size: 12px;
        margin: 0;
        font-weight: 600;
        letter-spacing: 0.08em;
        text-transform: uppercase;
      }

      .terminal-wrap {
        overflow: auto;
        padding: 16px;
        background: var(--bg);
      }

      .terminal-wrap:focus {
        outline: none;
      }

      .terminal-grid {
        display: grid;
        gap: 0;
        font-family:
          ui-monospace,
          SFMono-Regular,
          Menlo,
          Consolas,
          monospace;
        font-size: 12px;
        line-height: 1.25;
        width: max-content;
      }

      .row {
        display: flex;
        position: relative;
      }

      .row.touched-row {
        background: rgba(88, 166, 255, 0.08);
      }

      .row.touched-only-row {
        background: rgba(255, 184, 108, 0.08);
      }

      .cell {
        width: 0.62em;
        white-space: pre;
        color: var(--text);
        background: rgba(var(--changed-rgb), 0);
      }

      .cell.cursor {
        outline: 1px solid var(--accent);
        outline-offset: -1px;
      }

      .side {
        display: grid;
        gap: 0;
        align-content: start;
        border-left: 1px solid var(--line);
        background: var(--bg-elevated);
      }

      .stats {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 0;
        padding: 0;
      }

      .stat-label {
        font-size: 11px;
        color: var(--muted);
        margin-bottom: 4px;
        text-transform: uppercase;
        letter-spacing: 0.04em;
      }

      .stat-value {
        font-size: 16px;
      }

      .stat {
        padding: 12px 16px;
        border-bottom: 1px solid var(--line);
      }

      .stat:nth-child(odd) {
        border-right: 1px solid var(--line);
      }

      .timeline {
        max-height: 40vh;
        overflow: auto;
        padding: 0;
      }

      .timeline-item {
        padding: 10px 16px;
        border-bottom: 1px solid var(--line);
        font-family:
          ui-monospace,
          SFMono-Regular,
          Menlo,
          Consolas,
          monospace;
        font-size: 12px;
      }

      .preview {
        color: var(--muted);
        margin-top: 4px;
        word-break: break-word;
      }

      .controls {
        display: flex;
        flex-direction: column;
        gap: 10px;
        padding: 16px;
      }

      textarea {
        font: inherit;
      }

      textarea {
        width: 100%;
        min-height: 88px;
        resize: vertical;
        background: var(--bg);
        color: var(--text);
        border: 1px solid var(--line);
        border-radius: 0;
        padding: 10px;
      }

      textarea:focus {
        outline: none;
        box-shadow: none;
      }

      .status {
        color: var(--muted);
        font-size: 12px;
        padding: 0 16px 16px;
        border-bottom: 1px solid var(--line);
      }

      .section {
        border-bottom: 1px solid var(--line);
      }

      .legend {
        padding: 12px 16px 16px;
        display: grid;
        gap: 10px;
      }

      .legend-item {
        display: flex;
        align-items: center;
        gap: 10px;
        font-size: 12px;
        color: var(--text);
      }

      .legend-swatch {
        width: 18px;
        height: 18px;
        border: 1px solid var(--line);
        flex: 0 0 auto;
      }

      .legend-swatch.changed-cell {
        background: rgba(var(--changed-rgb), 0.55);
      }

      .legend-swatch.touched-row {
        background: rgba(88, 166, 255, 0.16);
      }

      .legend-swatch.touched-only-row {
        background: rgba(255, 184, 108, 0.16);
      }

      .legend-swatch.cursor {
        background: transparent;
        outline: 1px solid var(--accent);
        outline-offset: -2px;
      }

      .detail-list {
        padding: 12px 16px 16px;
        display: grid;
        gap: 8px;
      }

      .detail-row {
        display: grid;
        gap: 4px;
      }

      .detail-label {
        font-size: 11px;
        color: var(--muted);
        text-transform: uppercase;
        letter-spacing: 0.04em;
      }

      .detail-value {
        font-family:
          ui-monospace,
          SFMono-Regular,
          Menlo,
          Consolas,
          monospace;
        font-size: 12px;
        line-height: 1.4;
        word-break: break-word;
      }

      #connection-status {
        color: var(--muted);
        font-family:
          ui-monospace,
          SFMono-Regular,
          Menlo,
          Consolas,
          monospace;
        font-size: 12px;
      }

      @media (max-width: 1100px) {
        .layout {
          grid-template-columns: 1fr;
        }

        .side {
          border-left: 0;
          border-top: 1px solid var(--line);
        }
      }
    </style>
  </head>
  <body>
    <div class="layout">
      <section>
        <div class="panel-header">
          <h2></h2>
          <div id="connection-status">Connecting…</div>
        </div>
        <div id="terminal-wrap" class="terminal-wrap" tabindex="0">
          <div id="terminal" class="terminal-grid" aria-live="polite"></div>
        </div>
      </section>

      <aside class="side">
        <section class="section">
          <div class="panel-header">
            <h2>Stats</h2>
          </div>
          <div class="stats">
            <div class="stat">
              <div class="stat-label">Frames</div>
              <div id="stat-frames" class="stat-value">0</div>
            </div>
            <div class="stat">
              <div class="stat-label">Writes</div>
              <div id="stat-writes" class="stat-value">0</div>
            </div>
            <div class="stat">
              <div class="stat-label">Bytes</div>
              <div id="stat-bytes" class="stat-value">0</div>
            </div>
            <div class="stat">
              <div class="stat-label">Print Chars</div>
              <div id="stat-printable" class="stat-value">0</div>
            </div>
            <div class="stat">
              <div class="stat-label">Control Chars</div>
              <div id="stat-control" class="stat-value">0</div>
            </div>
            <div class="stat">
              <div class="stat-label">ANSI Ops</div>
              <div id="stat-ansi" class="stat-value">0</div>
            </div>
            <div class="stat">
              <div class="stat-label">Changed Cells</div>
              <div id="stat-cells" class="stat-value">0</div>
            </div>
            <div class="stat">
              <div class="stat-label">Changed Rows</div>
              <div id="stat-rows" class="stat-value">0</div>
            </div>
            <div class="stat">
              <div class="stat-label">Touched Rows</div>
              <div id="stat-touched-rows" class="stat-value">0</div>
            </div>
            <div class="stat">
              <div class="stat-label">Noise Rows</div>
              <div id="stat-noise-rows" class="stat-value">0</div>
            </div>
            <div class="stat">
              <div class="stat-label">Child State</div>
              <div id="stat-exit" class="stat-value">running</div>
            </div>
          </div>
        </section>

        <section class="section">
          <div class="panel-header">
            <h2>Legend</h2>
          </div>
          <div class="legend">
            <div class="legend-item">
              <span class="legend-swatch changed-cell"></span>
              <span>Changed cell in the visible terminal snapshot</span>
            </div>
            <div class="legend-item">
              <span class="legend-swatch touched-row"></span>
              <span>Row touched by the raw stdout chunk</span>
            </div>
            <div class="legend-item">
              <span class="legend-swatch touched-only-row"></span>
              <span>Noise row: touched by ANSI/control ops but visually unchanged</span>
            </div>
            <div class="legend-item">
              <span class="legend-swatch cursor"></span>
              <span>Current cursor position after the chunk is applied</span>
            </div>
          </div>
        </section>

        <section class="section">
          <div class="panel-header">
            <h2>Latest Chunk</h2>
          </div>
          <div class="detail-list">
            <div class="detail-row">
              <div class="detail-label">Touched Rows</div>
              <div id="chunk-touched-rows" class="detail-value">-</div>
            </div>
            <div class="detail-row">
              <div class="detail-label">Visible Diff Rows</div>
              <div id="chunk-changed-rows" class="detail-value">-</div>
            </div>
            <div class="detail-row">
              <div class="detail-label">Noise Rows</div>
              <div id="chunk-noise-rows" class="detail-value">-</div>
            </div>
            <div class="detail-row">
              <div class="detail-label">Operation Runs</div>
              <div id="chunk-ops" class="detail-value">-</div>
            </div>
            <div class="detail-row">
              <div class="detail-label">Raw Chunk Preview</div>
              <div id="chunk-preview" class="detail-value">-</div>
            </div>
          </div>
        </section>

        <section class="section">
          <div class="panel-header">
            <h2>Input</h2>
          </div>
          <div class="controls">
            <textarea id="input-box" placeholder="Type and press Enter" autofocus></textarea>
          </div>
          <div id="input-status" class="status"></div>
        </section>

        <section class="section">
          <div class="panel-header">
            <h2>Timeline</h2>
          </div>
          <div id="timeline" class="timeline"></div>
        </section>
      </aside>
    </div>

    <script>
      const terminal = document.getElementById("terminal");
      const terminalWrap = document.getElementById("terminal-wrap");
      const timeline = document.getElementById("timeline");
      const connectionStatus = document.getElementById("connection-status");
      const inputStatus = document.getElementById("input-status");
      const inputBox = document.getElementById("input-box");
      const stats = {
        frames: document.getElementById("stat-frames"),
        writes: document.getElementById("stat-writes"),
        bytes: document.getElementById("stat-bytes"),
        printable: document.getElementById("stat-printable"),
        control: document.getElementById("stat-control"),
        ansi: document.getElementById("stat-ansi"),
        cells: document.getElementById("stat-cells"),
        rows: document.getElementById("stat-rows"),
        touchedRows: document.getElementById("stat-touched-rows"),
        noiseRows: document.getElementById("stat-noise-rows"),
        exit: document.getElementById("stat-exit"),
      };
      const chunkDetails = {
        touchedRows: document.getElementById("chunk-touched-rows"),
        changedRows: document.getElementById("chunk-changed-rows"),
        noiseRows: document.getElementById("chunk-noise-rows"),
        ops: document.getElementById("chunk-ops"),
        preview: document.getElementById("chunk-preview"),
      };

      const FADE_MS = 700;
      let previousLines = [];
      let latestFrame = null;
      let heatMap = [];
      let fadeAnimationId = null;

      function setStats(frame) {
        const touchedRows = frame.touchedRows ?? [];
        const changedRows = frame.changedRows ?? [];
        const noiseRows = touchedRows.filter(row => !changedRows.includes(row));
        stats.frames.textContent = String(frame.seq ?? 0);
        stats.writes.textContent = String(frame.totalWrites ?? 0);
        stats.bytes.textContent = String(frame.totalBytes ?? 0);
        stats.printable.textContent = String(frame.printableChars ?? 0);
        stats.control.textContent = String(frame.controlChars ?? 0);
        stats.ansi.textContent = String(frame.escapeSequenceCount ?? 0);
        stats.cells.textContent = String(frame.changedCells ?? 0);
        stats.rows.textContent = String(changedRows.length);
        stats.touchedRows.textContent = String(touchedRows.length);
        stats.noiseRows.textContent = String(noiseRows.length);
        stats.exit.textContent = frame.childState ?? "running";
      }

      function formatRowRanges(rows) {
        if (!rows || rows.length === 0) {
          return "-";
        }
        const ranges = [];
        let start = rows[0];
        let end = rows[0];
        for (let index = 1; index < rows.length; index++) {
          const row = rows[index];
          if (row === end + 1) {
            end = row;
            continue;
          }
          ranges.push(start === end ? String(start) : start + "-" + end);
          start = row;
          end = row;
        }
        ranges.push(start === end ? String(start) : start + "-" + end);
        return ranges.join(", ");
      }

      function formatOperationRuns(runs) {
        if (!runs || runs.length === 0) {
          return "-";
        }
        return runs
          .slice(0, 16)
          .map(run => run.label + (run.count > 1 ? " x" + run.count : ""))
          .join(" | ");
      }

      function renderChunkDetails(frame) {
        const touchedRows = frame.touchedRows ?? [];
        const changedRows = frame.changedRows ?? [];
        const noiseRows = touchedRows.filter(row => !changedRows.includes(row));
        chunkDetails.touchedRows.textContent = formatRowRanges(touchedRows);
        chunkDetails.changedRows.textContent = formatRowRanges(changedRows);
        chunkDetails.noiseRows.textContent = formatRowRanges(noiseRows);
        chunkDetails.ops.textContent = formatOperationRuns(
          frame.operationRuns ?? []
        );
        chunkDetails.preview.textContent = frame.preview || "-";
      }

      function addTimelineItem(frame) {
        const touchedRows = frame.touchedRows ?? [];
        const changedRows = frame.changedRows ?? [];
        const noiseRows = touchedRows.filter(row => !changedRows.includes(row));
        const item = document.createElement("div");
        item.className = "timeline-item";
        const summary = document.createElement("div");
        summary.textContent = [
          "#",
          String(frame.seq ?? 0),
          " | ",
          String(frame.bytes ?? 0),
          " bytes | ",
          String(frame.changedCells ?? 0),
          " cells | diff ",
          formatRowRanges(changedRows),
          " | touched ",
          formatRowRanges(touchedRows),
          " | noise ",
          formatRowRanges(noiseRows),
        ].join("");
        item.appendChild(summary);
        const ops = document.createElement("div");
        ops.className = "preview";
        ops.textContent = formatOperationRuns(frame.operationRuns ?? []);
        item.appendChild(ops);
        if (frame.preview) {
          const preview = document.createElement("div");
          preview.className = "preview";
          preview.textContent = frame.preview;
          item.appendChild(preview);
        }
        timeline.prepend(item);
        while (timeline.children.length > 60) {
          timeline.removeChild(timeline.lastChild);
        }
      }

      function ensureHeatMapSize(rows, cols) {
        while (heatMap.length < rows) {
          heatMap.push([]);
        }
        if (heatMap.length > rows) {
          heatMap.length = rows;
        }
        for (let rowIndex = 0; rowIndex < rows; rowIndex++) {
          const row = heatMap[rowIndex];
          while (row.length < cols) {
            row.push(0);
          }
          if (row.length > cols) {
            row.length = cols;
          }
        }
      }

      function scheduleFadeRender() {
        if (fadeAnimationId !== null) {
          return;
        }
        fadeAnimationId = requestAnimationFrame(() => {
          fadeAnimationId = null;
          if (!latestFrame) {
            return;
          }
          renderFrame(latestFrame, false);
          const now = Date.now();
          let hasVisibleHeat = false;
          for (let rowIndex = 0; rowIndex < heatMap.length; rowIndex++) {
            const row = heatMap[rowIndex];
            for (let colIndex = 0; colIndex < row.length; colIndex++) {
              if (now - row[colIndex] < FADE_MS) {
                hasVisibleHeat = true;
                break;
              }
            }
            if (hasVisibleHeat) {
              break;
            }
          }
          if (hasVisibleHeat) {
            scheduleFadeRender();
          }
        });
      }

      function renderFrame(frame, applyChanges = true) {
        latestFrame = frame;
        const lines = frame.lines ?? [];
        const changedRows = new Set(frame.changedRows ?? []);
        const touchedRows = new Set(frame.touchedRows ?? []);
        const rows = lines.length;
        const cols = frame.cols ?? 0;
        const now = Date.now();
        ensureHeatMapSize(rows, cols);
        terminal.style.gridTemplateRows = "repeat(" + rows + ", auto)";

        const fragment = document.createDocumentFragment();
        for (let rowIndex = 0; rowIndex < rows; rowIndex++) {
          const rowEl = document.createElement("div");
          rowEl.className = "row";
          if (touchedRows.has(rowIndex)) {
            rowEl.classList.add("touched-row");
            if (!changedRows.has(rowIndex)) {
              rowEl.classList.add("touched-only-row");
            }
          }
          const currentLine = lines[rowIndex] ?? "";
          const previousLine = previousLines[rowIndex] ?? "";

          for (let colIndex = 0; colIndex < cols; colIndex++) {
            const cell = document.createElement("span");
            const currentChar = currentLine[colIndex] ?? " ";
            const previousChar = previousLine[colIndex] ?? " ";
            if (applyChanges && currentChar !== previousChar) {
              heatMap[rowIndex][colIndex] = now;
            }
            const age = now - heatMap[rowIndex][colIndex];
            const heat =
              age < FADE_MS ? Math.max(0, 1 - age / FADE_MS) : 0;
            cell.className = "cell";
            if (heat > 0) {
              cell.style.backgroundColor =
                "rgba(var(--changed-rgb), " + (0.75 * heat).toFixed(3) + ")";
            }
            if (
              rowIndex === frame.cursorRow &&
              colIndex === frame.cursorCol
            ) {
              cell.classList.add("cursor");
            }
            cell.textContent = currentChar;
            rowEl.appendChild(cell);
          }
          fragment.appendChild(rowEl);
        }

        terminal.replaceChildren(fragment);
        previousLines = lines.slice();
        scheduleFadeRender();
      }

      async function sendInput(payload) {
        try {
          inputStatus.textContent = "Sending…";
          const response = await fetch("/input", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(payload),
          });
          if (!response.ok) {
            throw new Error(await response.text());
          }
          if (payload.text) {
            inputBox.value = "";
          }
          inputStatus.textContent = "Sent";
        } catch (error) {
          inputStatus.textContent = "Failed: " + String(error);
        }
      }

      function eventToTerminalSequence(event) {
        if (event.metaKey) {
          return null;
        }

        const specialKeys = {
          Enter: "\r",
          Backspace: "\u007f",
          Escape: "\u001b",
          Tab: event.shiftKey ? "\u001b[Z" : "\t",
          ArrowUp: "\u001b[A",
          ArrowDown: "\u001b[B",
          ArrowRight: "\u001b[C",
          ArrowLeft: "\u001b[D",
          Home: "\u001b[H",
          End: "\u001b[F",
          Delete: "\u001b[3~",
          PageUp: "\u001b[5~",
          PageDown: "\u001b[6~",
        };

        if (specialKeys[event.key]) {
          return specialKeys[event.key];
        }

        if (event.ctrlKey && event.key.length === 1) {
          const upper = event.key.toUpperCase();
          if (upper >= "@" && upper <= "_") {
            return String.fromCharCode(upper.charCodeAt(0) - 64);
          }
          if (upper >= "A" && upper <= "Z") {
            return String.fromCharCode(upper.charCodeAt(0) - 64);
          }
        }

        if (!event.ctrlKey && event.key.length === 1) {
          return event.altKey ? "\u001b" + event.key : event.key;
        }

        return null;
      }

      inputBox.addEventListener("keydown", event => {
        if (event.key === "Escape") {
          event.preventDefault();
          void sendInput({ control: "escape" });
          return;
        }
        if (event.ctrlKey && event.key.toLowerCase() === "c") {
          event.preventDefault();
          void sendInput({ control: "ctrlc" });
          return;
        }
        if (event.key === "Enter" && !event.shiftKey) {
          event.preventDefault();
          const value = inputBox.value;
          void sendInput({ text: value, control: "enter" });
        }
      });

      terminalWrap.addEventListener("click", () => {
        terminalWrap.focus();
      });

      terminalWrap.addEventListener("keydown", event => {
        const sequence = eventToTerminalSequence(event);
        if (sequence === null) {
          return;
        }
        event.preventDefault();
        void sendInput({ text: sequence });
      });

      async function bootstrap() {
        const snapshotResponse = await fetch("/snapshot");
        const snapshot = await snapshotResponse.json();
        renderFrame(snapshot);
        setStats(snapshot);
        renderChunkDetails(snapshot);
        inputBox.focus();

        const source = new EventSource("/events");
        source.onopen = () => {
          connectionStatus.textContent = "Live";
        };
        source.onerror = () => {
          connectionStatus.textContent = "Disconnected";
        };
        source.onmessage = event => {
          const frame = JSON.parse(event.data);
          renderFrame(frame);
          setStats(frame);
          renderChunkDetails(frame);
          addTimelineItem(frame);
        };
      }

      void bootstrap();
    </script>
  </body>
</html>
`;var x=s("./src/utils/open-browser.ts"),b=function(e,t,s,o){return new(s||(s=Promise))((function(n,r){function a(e){try{l(o.next(e))}catch(e){r(e)}}function i(e){try{l(o.throw(e))}catch(e){r(e)}}function l(e){var t;e.done?n(e.value):(t=e.value,t instanceof s?t:new s((function(e){e(t)}))).then(a,i)}l((o=o.apply(e,t||[])).next())}))};const C=(0,r.dirname)((0,a.fileURLToPath)("file:///workdir/packages/agent-cli/src/commands/repaint-debug.ts"));function y(e){return e.split("").join("\\u001b").split("\r").join("\\r").split("\n").join("\\n").split("\t").join("\\t").slice(0,240)}class R{constructor(e){this.childArgs=e,this.server=(0,n.createServer)(this.handleRequest.bind(this)),this.sseClients=new Set,this.frameSeq=0,this.totalBytes=0,this.totalWrites=0,this.childState="running",this.waitForStopResolve=null,this.buffer=new f(32,96),this.parser=new(c())(this.buffer),this.latestFrame=this.snapshotToFrame({snapshot:this.buffer.getSnapshot(),bytes:0,preview:"session-start",printableChars:0,controlChars:0,escapeSequenceCount:0,changedCells:0,changedRows:[],touchedRows:[],operationRuns:[]}),this.ptyProcess=this.spawnChild(96,32)}start(){return b(this,void 0,void 0,(function*(){yield new Promise(((e,t)=>{this.server.once("error",t),this.server.listen(0,"127.0.0.1",(()=>e()))}));const e=`http://127.0.0.1:${this.server.address().port}`;(0,d.p2)(`Repaint debug UI: ${e}\n`),(0,d.p2)("Child agent-cli is running in a PTY. Use the browser UI to send input. Press Ctrl+C here to stop.\n");try{yield(0,x.ph)(e)}catch(e){}return e}))}waitUntilStopped(){return b(this,void 0,void 0,(function*(){return new Promise((e=>{this.waitForStopResolve=e}))}))}stop(){return b(this,void 0,void 0,(function*(){var e;for(const e of this.sseClients)e.end();this.sseClients.clear();try{this.ptyProcess.kill()}catch(e){}yield new Promise((e=>this.server.close((()=>e())))),null===(e=this.waitForStopResolve)||void 0===e||e.call(this)}))}spawnChild(e,t){const n=function(){try{return s("./src/commands sync recursive").resolve("@lydell/node-pty-linux-x64/spawn-helper")}catch(e){return}}(),a={name:"xterm-256color",cols:e,rows:t,cwd:process.cwd(),env:Object.assign(Object.assign({},process.env),{NO_OPEN_BROWSER:"1"})};n&&(a.helperPath=n);const l=function(){const e=(0,r.resolve)(C,"..","index.tsx");return(0,o.existsSync)(e)?e:(0,r.resolve)(C,"..","index.js")}(),c=[...process.execArgv,l,...this.childArgs],d=i.cH(process.execPath,c,a);return d.onData((e=>{const t=this.buffer.getSnapshot(),s=function(e,t){var s,o,n;let r=t.cursorRow,a=t.cursorCol,i=null,l=0,c=0,d=0;const w=new Set,m=[],f=()=>{r=u(r+1,0,t.rows-1)},g=e=>{const t=m.at(-1);t&&t.label===e?m[m.length-1]={label:e,count:t.count+1}:m.push({label:e,count:1})},x=e=>{"\0"!==e&&(l+=1,v(w,t.rows,r),a+=1,a>=t.cols&&(a=0,f()))},b=e=>{switch(e){case 0:for(let e=r;e<t.rows;e++)v(w,t.rows,e);return;case 1:for(let e=0;e<=r;e++)v(w,t.rows,e);return;case 2:case 3:for(let e=0;e<t.rows;e++)v(w,t.rows,e);return r=0,void(a=0);default:return}};let C=0;for(;C<e.length;){const l=e[C];if(""!==l)if(h(l)){switch(c+=1,l){case"\n":case"\v":case"\f":g("LF"),f();break;case"\r":g("CR"),a=0;break;case"\b":g("BS"),a=Math.max(0,a-1);break;case"\t":g("TAB"),a=Math.min(t.cols-1,8*Math.floor(a/8)+8);break;default:g(`CTRL 0x${l.charCodeAt(0).toString(16).padStart(2,"0")}`)}C+=1}else g("TEXT"),x(l),C+=1;else{d+=1;const l=e[C+1];if("["===l){let l=C+2,c="",d="";for(;l<e.length;){const t=e[l],s=t.charCodeAt(0);if(s>=48&&s<=63)c+=t,l+=1;else{if(!(s>=32&&s<=47))break;d+=t,l+=1}}const h=null!==(s=e[l])&&void 0!==s?s:"",m=c.split(";").filter((e=>e.length>0)).map((e=>Number(e))),f=null!==(o=m[0])&&void 0!==o?o:0,x=null!==(n=m[1])&&void 0!==n?n:0;switch(g(p(d,c,h)),h){case"A":r=u(r-Math.max(f,1),0,t.rows-1);break;case"B":r=u(r+Math.max(f,1),0,t.rows-1);break;case"C":a=u(a+Math.max(f,1),0,t.cols-1);break;case"D":a=u(a-Math.max(f,1),0,t.cols-1);break;case"E":r=u(r+Math.max(f,1),0,t.rows-1),a=0;break;case"F":r=u(r-Math.max(f,1),0,t.rows-1),a=0;break;case"G":a=u(Math.max(f,1)-1,0,t.cols-1);break;case"H":case"f":r=u(Math.max(f,1)-1,0,t.rows-1),a=u(Math.max(x||1,1)-1,0,t.cols-1);break;case"J":b(f);break;case"K":v(w,t.rows,r);break;case"s":i={row:r,col:a};break;case"u":i&&(r=u(i.row,0,t.rows-1),a=u(i.col,0,t.cols-1))}C=l+1;continue}if("]"===l){let t=C+2;for(;t<e.length;){const s=e[t];if(""===s){t+=1;break}if(""===s&&"\\"===e[t+1]){t+=2;break}t+=1}g("OSC"),C=t;continue}const c=null!=l?l:"";switch(g(`ESC ${c||"?"}`),c){case"7":i={row:r,col:a};break;case"8":i&&(r=u(i.row,0,t.rows-1),a=u(i.col,0,t.cols-1));break;case"D":f();break;case"M":r=u(r-1,0,t.rows-1);break;case"E":f(),a=0}C+=c?2:1}}return{printableChars:l,controlChars:c,escapeSequenceCount:d,touchedRows:[...w].sort(((e,t)=>e-t)),operationRuns:m}}(e,t);this.parser.parse(e);const o=this.buffer.getSnapshot(),n=function(e,t){var s,o,n,r;const a=[];let i=0;for(let l=0;l<Math.max(e.rows,t.rows);l++){const c=null!==(s=e.lines[l])&&void 0!==s?s:"",d=null!==(o=t.lines[l])&&void 0!==o?o:"";let u=!1;const h=Math.max(e.cols,t.cols,c.length,d.length);for(let e=0;e<h;e++)(null!==(n=c[e])&&void 0!==n?n:" ")!==(null!==(r=d[e])&&void 0!==r?r:" ")&&(i+=1,u=!0);u&&a.push(l)}return{changedCells:i,changedRows:a}}(t,o);this.totalBytes+=Buffer.byteLength(e,"utf8"),this.totalWrites+=1,this.latestFrame=this.snapshotToFrame({snapshot:o,bytes:Buffer.byteLength(e,"utf8"),preview:y(e),printableChars:s.printableChars,controlChars:s.controlChars,escapeSequenceCount:s.escapeSequenceCount,changedCells:n.changedCells,changedRows:n.changedRows,touchedRows:s.touchedRows,operationRuns:s.operationRuns}),this.broadcastFrame(this.latestFrame)})),d.onExit((({exitCode:e,signal:t})=>{this.childState=void 0!==t?`signal:${t}`:`exited:${e}`,this.latestFrame=Object.assign(Object.assign({},this.latestFrame),{childState:this.childState,preview:`child-exit ${this.childState}`}),this.broadcastFrame(this.latestFrame)})),d}snapshotToFrame(e){return this.frameSeq+=1,{seq:this.frameSeq,timestampMs:Date.now(),bytes:e.bytes,totalBytes:this.totalBytes,totalWrites:this.totalWrites,printableChars:e.printableChars,controlChars:e.controlChars,escapeSequenceCount:e.escapeSequenceCount,changedCells:e.changedCells,changedRows:e.changedRows,touchedRows:e.touchedRows,operationRuns:e.operationRuns,cursorRow:e.snapshot.cursorRow,cursorCol:e.snapshot.cursorCol,rows:e.snapshot.rows,cols:e.snapshot.cols,lines:e.snapshot.lines,preview:e.preview,childState:this.childState}}broadcastFrame(e){const t=`data: ${JSON.stringify(e)}\n\n`;for(const e of this.sseClients)e.write(t)}handleRequest(e,t){return b(this,void 0,void 0,(function*(){if(!e.url)return t.statusCode=404,void t.end();if("GET"===e.method&&"/"===e.url)return t.setHeader("Content-Type","text/html; charset=utf-8"),void t.end(g);if("GET"===e.method&&"/snapshot"===e.url)return t.setHeader("Content-Type","application/json; charset=utf-8"),void t.end(JSON.stringify(this.latestFrame));if("GET"===e.method&&"/events"===e.url)return t.writeHead(200,{"Content-Type":"text/event-stream","Cache-Control":"no-cache",Connection:"keep-alive","Access-Control-Allow-Origin":"*"}),this.sseClients.add(t),t.write(`data: ${JSON.stringify(this.latestFrame)}\n\n`),void e.on("close",(()=>{this.sseClients.delete(t)}));if("POST"!==e.method||"/input"!==e.url)t.statusCode=404,t.end("Not found");else try{const s=yield function(e){return new Promise(((t,s)=>{const o=[];e.on("data",(e=>o.push(Buffer.from(e)))),e.on("end",(()=>{try{const e=Buffer.concat(o).toString("utf8");t(JSON.parse(e))}catch(e){s(e)}})),e.on("error",s)}))}(e);"string"==typeof s.text&&s.text.length>0&&this.ptyProcess.write(s.text),s.control&&this.ptyProcess.write(this.controlToSequence(s.control)),t.statusCode=204,t.end()}catch(e){t.statusCode=400,t.end(e instanceof Error?e.message:String(e))}}))}controlToSequence(e){switch(e){case"enter":return"\r";case"ctrlc":return"";case"escape":return"";default:return""}}}function S(e){return b(this,void 0,void 0,(function*(){const t=new R(e),s=()=>b(this,void 0,void 0,(function*(){process.off("SIGINT",o),process.off("SIGTERM",n),yield t.stop()})),o=()=>{s()},n=()=>{s()};process.on("SIGINT",o),process.on("SIGTERM",n),yield t.start(),yield t.waitUntilStopped()}))}},"./src/commands sync recursive"(e){function t(e){var t=new Error("Cannot find module '"+e+"'");throw t.code="MODULE_NOT_FOUND",t}t.keys=()=>[],t.resolve=t,t.id="./src/commands sync recursive",e.exports=t}};