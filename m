Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7418C56457
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Jan 2024 09:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706520460; cv=none; b=LJS5a3UfR3Puu+JDPK36zLqjfaAncP3wL9ARhDX6RwUGNK13zEA0zkILk3pVpj9vp5bKycrcvhsEhQdyjtKDP5kZvi76ro5C3uQHiuv8SGeep6VSVAZb7KbQze4zrysVF41QaTiWI373fddvHMEwh60lVUZPX8FtNCOMhwapsJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706520460; c=relaxed/simple;
	bh=V9Y1yX1zp9r8SCxikLX3xMWBS5X1n6TApm7GyCBw5Kw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IGkOvzrlY0AFlvsb98YhPs7bo6wG0KG/PCPoPzbH8o0mxN/t+gNgphxAvKv6KyaIoXCGXsCWgms0HyqwmJjKPxIRjXlcRGqSwTLE/j92Y6J9E8O1HqLBR/NqyDMIMhmMWmLvuS/jSNTVpwtQYfu3kxrtGkVrngIgps9lbnq7mxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 40T9Pxn0079984;
	Mon, 29 Jan 2024 17:25:59 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Mon, 29 Jan 2024
 17:25:58 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <acme@kernel.org>, <adrian.hunter@intel.com>, <ajones@ventanamicro.com>,
        <alexander.shishkin@linux.intel.com>, <andre.przywara@arm.com>,
        <anup@brainfault.org>, <aou@eecs.berkeley.edu>,
        <atishp@atishpatra.org>, <conor+dt@kernel.org>,
        <conor.dooley@microchip.com>, <conor@kernel.org>,
        <devicetree@vger.kernel.org>, <evan@rivosinc.com>,
        <geert+renesas@glider.be>, <guoren@kernel.org>, <heiko@sntech.de>,
        <irogers@google.com>, <jernej.skrabec@gmail.com>, <jolsa@kernel.org>,
        <jszhang@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-perf-users@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-sunxi@lists.linux.dev>, <locus84@andestech.com>,
        <magnus.damm@gmail.com>, <mark.rutland@arm.com>, <mingo@redhat.com>,
        <n.shubin@yadro.com>, <namhyung@kernel.org>, <palmer@dabbelt.com>,
        <paul.walmsley@sifive.com>, <peterlin@andestech.com>,
        <peterz@infradead.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <rdunlap@infradead.org>, <robh+dt@kernel.org>, <samuel@sholland.org>,
        <sunilvl@ventanamicro.com>, <tglx@linutronix.de>,
        <tim609@andestech.com>, <uwu@icenowy.me>, <wens@csie.org>,
        <will@kernel.org>, <inochiama@outlook.com>, <unicorn_wang@outlook.com>,
        <wefu@redhat.com>
Subject: [PATCH v8 00/10] Support Andes PMU extension
Date: Mon, 29 Jan 2024 17:25:43 +0800
Message-ID: <20240129092553.2058043-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 40T9Pxn0079984

Hi All,

This patch series introduces the Andes PMU extension, which serves the
same purpose as Sscofpmf and Smcntrpmf. Its non-standard local interrupt
is assigned to bit 18 in the custom S-mode local interrupt enable and
pending registers (slie/slip), while the interrupt cause is (256 + 18).

Linux patches based on:
- ed5b7cf ("riscv: errata: andes: Probe for IOCP only once in boot stage")
It can be found on Andes Technology GitHub:
- https://github.com/andestech/linux/commits/andes-pmu-support-v8

The PMU device tree node used on AX45MP:
- https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu_support.md#example-3

Locus Wei-Han Chen (1):
  riscv: andes: Support specifying symbolic firmware and hardware raw
    events

Yu Chien Peter Lin (9):
  riscv: errata: Rename defines for Andes
  irqchip/riscv-intc: Allow large non-standard interrupt number
  irqchip/riscv-intc: Introduce Andes hart-level interrupt controller
  dt-bindings: riscv: Add Andes interrupt controller compatible string
  riscv: dts: renesas: r9a07g043f: Update compatible string to use Andes
    INTC
  perf: RISC-V: Eliminate redundant interrupt enable/disable operations
  perf: RISC-V: Introduce Andes PMU to support perf event sampling
  dt-bindings: riscv: Add Andes PMU extension description
  riscv: dts: renesas: Add Andes PMU extension for r9a07g043f

 .../devicetree/bindings/riscv/cpus.yaml       |   6 +-
 .../devicetree/bindings/riscv/extensions.yaml |   7 +
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi   |   4 +-
 arch/riscv/errata/andes/errata.c              |  10 +-
 arch/riscv/include/asm/errata_list.h          |  13 +-
 arch/riscv/include/asm/hwcap.h                |   1 +
 arch/riscv/include/asm/vendorid_list.h        |   2 +-
 arch/riscv/kernel/alternative.c               |   2 +-
 arch/riscv/kernel/cpufeature.c                |   1 +
 drivers/irqchip/irq-riscv-intc.c              |  88 ++++++++++--
 drivers/perf/Kconfig                          |  14 ++
 drivers/perf/riscv_pmu_sbi.c                  |  37 ++++-
 include/linux/soc/andes/irq.h                 |  18 +++
 .../arch/riscv/andes/ax45/firmware.json       |  68 ++++++++++
 .../arch/riscv/andes/ax45/instructions.json   | 127 ++++++++++++++++++
 .../arch/riscv/andes/ax45/memory.json         |  57 ++++++++
 .../arch/riscv/andes/ax45/microarch.json      |  77 +++++++++++
 tools/perf/pmu-events/arch/riscv/mapfile.csv  |   1 +
 18 files changed, 494 insertions(+), 39 deletions(-)
 create mode 100644 include/linux/soc/andes/irq.h
 create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/instructions.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/memory.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/microarch.json

-- 
2.34.1

