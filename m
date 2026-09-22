Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5087437F33D
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 03:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790048844; cv=none; b=ks8A3nFE86nI4jElKCBhrVCTMpM2Y01GUxDxHjJ98cDFO8kOUUiPQ8eNsJdT9Si8tX5n5lv7SuOxvz0ajNp6nBkmN2Cy1yI9bQr+i49GM3Nqxre+xilPxcHKTfd2OgHU99SAG7anrRrEmxDgePEdScu974EkXM8r6aAo15jndP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790048844; c=relaxed/simple;
	bh=8gPQW8hOKk7T4ghxf/NTh0C7Ddv4ez2fIVwXsZWXyIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sDIQ1ZjPCRfkutTtEziJqWab6suw/3lNi7LWc7RMv0icOXTisrrowRh9ATVYu9JpukWFdeagRDVmXRvxdO36tmPqhdF14CVbZZE+GcGe5c64CuEjUFvBqXMOcbXEYxbuk5mQJ9hTPx+4DJZy33FSQ6qNbIZvqQGpIhSjlnbEIZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sz2PX/Ay; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sz2PX/Ay"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-87c938111a7so3814177b3.0
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 20:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790048842; x=1790653642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ee8JaG9BGagXKRHbX2oaZkUXip6gYk8l6UEg8uPe+C0=;
        b=sz2PX/AylSeKjJqrQgE9O6WaeQ6umstbusJ52VbDMDPGzFo6GEKsWvJJcqF1E7qK7Y
         ke3vtBn5uuOP4dpbozjE5Wrn2Gm5bNLi8FidtDyFY9wMKsIlEo3PUdPWo+lj7GKKDo08
         e7IT+BeBTqg0nU2WMFTnt/vUFrZ3/eqhMajLB8kLx94ryYXBOpf+Uc6ZDYNkMUUBsTPS
         ite78989NtxRUDPRWgr6Tb6kSg1ILRtZmHvpLFf7g9jTa7akpyFryCntJHwakQpjV5dk
         no8Rj55PSIs7VZtalHEf2QIyvLA8xXpsfcJCSpXhB6gvLJDCvAFhv7hbeduRmaKCzRmm
         cVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790048842; x=1790653642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ee8JaG9BGagXKRHbX2oaZkUXip6gYk8l6UEg8uPe+C0=;
        b=AJY1uraQnCa20UeazVbvVnrOoxrV1kFqOcM8z+6UQ5jDlmlQ7kL7IkLek50yY0khV9
         Al7DsNP8q3rr8pxkwZp7NssnQdlSV/EEj3Z8ApI5+Wejaf+ENqN2qOUuR38hrGl1ltF4
         7P+PZVV/NJGhrtjFPprwCmlJcEmEEWJ+GMc62JTCn60ipyYK7Pd8skyjUKSVNipyIHf1
         hU4lN8TPi5XYalaYBgLxbWhEbBRKjtQQmFlWdU8JmpyXfOQSSQHYnlv11f+sL+ScyXLJ
         PVJIFkvJQP4QR0N6oKjRziZTjx5GR9LDI2X5/3sZ8idbL+5wbI2ASmN9k9hWeILMJw0A
         UdnQ==
X-Gm-Message-State: AFuF++lxYSUdcqJA278Zbbs48O/lDMeS56Qoi4v+l3wDql12eHbRZ0dE
	4G5nCgTUXyWJVJWfrnxhPO/6IYsHrPwVXY+fiy7b4hm/lRybPd/O46gO8OZ/lIxQ
X-Gm-Gg: AYBFou17i8sLAKlJE5p9/xHcrm0yWysaohPJ8TT3FCJYF5Nqcy1oq6GsjP0m3ERu3ec
	58N4/dAwxwNoZEMI1n8GQUowKnUBazYWRwp7NXk8UAi7R79mjfSHbk0+O5iY3rUM7MTlzeJeMHa
	YOhyscHf6IAh99zSsI1D0IFek5Z5x1Jo1WgXO7e93FlepqdcjQdezuzXbdf0lyqh930le30fPxw
	01yB+vayfW1u8hPKwed1zwvFZfttcYUqy/Okzg3lrVVcVQCwONueiw58AT3BFhkbufObvoeCKz9
	QZPsCJD9WIurAkc4K+DuSIQQG1SpWDdZx5k3t7zF3RrIs5lgoANXnG99ZOTZfhDqwH5GDEt5OVX
	kQiOzOS2PxqG8JApE3EZHOv+MCQtOAmDZb1PJ/F0w9Vs7N3sIGsmlZI+L8vBUO7RnuF2k6W3MPC
	mAwHPuykk+/fhi6JMavKOuhhYr/eJtfoIHRjaL4ttR7jA9eJJViPzqr9Z2zKWm0O4Vgg==
X-Received: by 2002:a05:690c:6d81:b0:86f:8542:5c43 with SMTP id 00721157ae682-8a1f5d84696mr8428717b3.14.1790048842003;
        Mon, 21 Sep 2026 20:47:22 -0700 (PDT)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2bd79e82bsm1822337b3.5.2026.09.21.20.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:47:21 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH 0/7] remoteproc/mailbox: add Allwinner A523/A527/T527 E907 RISC-V support
Date: Mon, 21 Sep 2026 22:47:04 -0500
Message-ID: <20260922034711.190253-1-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces mainline Linux support for the Alibaba T-Head
XuanTie E907 (RV32IMAFDC @ 200 MHz) RISC-V auxiliary co-processor and the
4-port hardware Message Box IP integrated into Allwinner A523, A527, and
T527 (sun55i) SoCs.

The series adds the standalone 4-port hardware Message Box driver with
KUnit tests, the XuanTie RemoteProc driver with da_to_va KUnit tests, the
associated Devicetree binding schemas, and DTS node enablement.

Background & Hardware Architecture
==================================
Allwinner sun55i SoCs integrate an octa-core ARM Cortex-A55 cluster
alongside an auxiliary XuanTie E907 RISC-V co-processor. The co-processor
boots from on-chip dedicated SRAM Space 0 (Host PA 0x07280000 / Core DA
0x3FFC0000, 256 KB), can access secondary switchable SRAM Space 1 (Host
PA 0x072C0000 / Core DA 0x40000000, 256 KB), and interacts with external
DDR DRAM across the SoC's internal AXI bus.

Inter-processor communication (IPC) is coordinated via a 4-port hardware
Message Box controller (CPUX_MSGBOX at 0x03003000). The mailbox acts as a
star crossbar connecting four processors on the silicon die:
  - Port 0: ARM Cortex-A55 host cluster
  - Port 1: Cadence Tensilica HiFi4 Audio DSP
  - Port 2: Power Management Unit (CPUS)
  - Port 3: XuanTie E907 RISC-V co-processor

The Cortex-A55 exposes 12 logical channels (4 per remote processor), where
Channels 8..11 route directly to the XuanTie E907.

Hardware Validation & Silicon Evidence
======================================
This driver series has been extensively validated on physical silicon using
the Radxa Cubie A5E development board (Allwinner A527 / T527) running
mainline Linux PREEMPT_RT:

1. In-Kernel KUnit Tests:
   - sun55i_msgbox_test: Register mapping, channel routing, and interrupt
     mask bit manipulation across all 4 ports.
   - sunxi_rproc_test: Comprehensive da_to_va address translation across
     SRAM Space 0 (Host PA & Core DA), SRAM Space 1, DDR DRAM carveouts,
     and trace memory regions.

2. Target Automated Test Suite:
   - testBasic.elf: Core reset de-assertion, SRAM boot, MISA CSR
     verification (0x40901125), and heartbeat logging via debugfs trace0.
   - testStringBinaryTrace0.elf: Sustained trace0 ring-buffer streaming,
     hardware single-precision FPU math (sine wave calculation), and
     packed binary telemetry parsing.
   - testCrash.elf: Machine-mode exception trap (mtvec) verification,
     capturing full register autopsy (mepc, mcause=0x2, 31 GPRs) upon
     intentional illegal instruction while the host remains stable.
   - testPingRpmsg.elf: Full Linux VirtIO RPMsg framework validation
     over dynamic DDR CMA buffers. Tested 1,000 round-trip ping-pong
     packets with 100% success rate, measuring ~175 us average RTT
     latency and 5.37 MB/s bandwidth at 512-byte VirtIO buffer size.

PREEMPT_RT Real-Time Compliance
===============================
When the E907 announces a new RPMsg channel via Name Service announcement,
the kernel's rpmsg_char/virtio_rpmsg_bus layers acquire sleeping mutexes
(device_register, blocking_notifier_call_chain). Calling these from
hard-IRQ context triggers "scheduling while atomic" warnings on PREEMPT_RT
kernels. In sunxi_rproc.c, the mailbox callback defers the VirtIO vring
interrupt handler via schedule_work(&priv->vq_work), ensuring 100% clean
operation on PREEMPT_RT kernels.

Design Decisions for Maintainer Review
======================================
1. Standalone drivers/mailbox/sun55i-msgbox.c vs sun6i-msgbox.c:
   The existing sun6i-msgbox.c driver is architected around a legacy
   2-core point-to-point mailbox with flat global registers. The sun55i
   hardware is a 4-processor crossbar where registers are banked per
   processor in independent 0x100-byte apertures with hardware routing
   tables and 8-entry FIFOs. A clean standalone controller driver
   was implemented to avoid extensive conditional branches across every
   function.

2. Devicetree YAML Schemas:
   Both allwinner,sun55i-a523-msgbox.yaml and allwinner,sun55i-rproc.yaml
   have been created and pass dt_binding_check and checkpatch.pl cleanly.

Acknowledgements & References
=============================
Thanks to the Linux-sunxi community and YuzukiHD for SyterKit and
FreeRTOS-HIFI4-DSP as independent references to cross-check register
offsets, SRAM mappings, and clock/reset sequencing on the T527 and A733.


Tim Michals (7):
  dt-bindings: mailbox: add Allwinner sun55i msgbox schema
  mailbox: sun55i: add Allwinner sun55i/sun60i 4-port Message Box driver
  mailbox: sun55i: add KUnit tests for routing and registers
  dt-bindings: remoteproc: add allwinner sun55i rproc binding
  remoteproc: sunxi: add allwinner riscv remoteproc driver
  remoteproc: sunxi: add KUnit tests for da_to_va address translation
  arm64: dts: allwinner: add a523 msgbox and remoteproc nodes

 .../mailbox/allwinner,sun55i-a523-msgbox.yaml |  93 ++
 .../remoteproc/allwinner,sun55i-rproc.yaml    | 152 +++
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  39 +
 drivers/mailbox/Kconfig                       |  20 +
 drivers/mailbox/Makefile                      |   3 +
 drivers/mailbox/sun55i-msgbox.c               | 337 +++++++
 drivers/mailbox/sun55i_msgbox_test.c          | 296 ++++++
 drivers/remoteproc/Kconfig                    |  19 +
 drivers/remoteproc/Makefile                   |   2 +
 drivers/remoteproc/sunxi_rproc.c              | 905 ++++++++++++++++++
 drivers/remoteproc/sunxi_rproc_test.c         | 442 +++++++++
 11 files changed, 2308 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml
 create mode 100644 drivers/mailbox/sun55i-msgbox.c
 create mode 100644 drivers/mailbox/sun55i_msgbox_test.c
 create mode 100644 drivers/remoteproc/sunxi_rproc.c
 create mode 100644 drivers/remoteproc/sunxi_rproc_test.c

-- 
2.53.0

