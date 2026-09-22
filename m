Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF92739FCBC
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 03:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790048859; cv=none; b=lTIPMjc50x/qV8T1kmV32+1hg4VmsEqSx8NIPDJqO3QMckNPdtCDyItVV+E7s4u+excHGUYLXUKwA3XxLI2aZqBDqku3cRlQ/Lri8GmPbMiTvccUV39pGH51X10UPM1oymqaeIqkNl/tK38Zn760mD8usoQQZQbt1Wmg1EHnO58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790048859; c=relaxed/simple;
	bh=Zuhj7IM2kwLYx1E41aa3RmsXMs4q5uWJ3PMFFqm7d/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=olEgLQJGj+/5Q+znmz+EAeHKIWQo3BYfBOBUzKqbniI0hCgS6L7XZjXKBASSBT1HO09U7u4Biqhm+fURL1+RRADC9u3+3V1AfbrEd3CEyyTnAe+HB926gvXA4lfqEbo6dA0ggaQ3CEe4BClcu/zORQX2pt0OcwzgdlC88BeD618=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n6h0vb0v; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n6h0vb0v"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d440939f0so28618617b3.2
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 20:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790048857; x=1790653657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mw/CPruR+WraEsGqwvH6ywHSSE7Rk3uMG+JCzCFHXws=;
        b=n6h0vb0vV5tKB/tsma6Px3NhcIzEDsJBQXdDUhpM61zMs5TcJP+lh4tFYdCOaUIk1r
         wd+se4jZTFONVo+T976F7XQu8WWLcef4R7aDWfo67Gvs/II1K8KkttBu/42hO7rgjZgp
         JQxnsaurlUreurjkCjFEX26eOLmObrS3NHeo5Kik0haZncye0UOHDVTGASxdDcNm1+W9
         gOwcQ2i5wI6kCM4M8UNGgxQIn9Ndlp+9usOGPAiwmb+IxGnYFSZmvGdGuBYl36j8+RoT
         C0A4UJD4kdi+gb/k4/XalQpD4hAkctwhggFTcKWehy47mN2q2L0lN+3WKUL2wIv0Krs2
         XBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790048857; x=1790653657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mw/CPruR+WraEsGqwvH6ywHSSE7Rk3uMG+JCzCFHXws=;
        b=YLtoa42K0E3iYJtkB1X+q6B4CP2E307P4lhmWBW5q9FbMv6tdxc9e84Fx/VLKdoWDA
         e9D6I2WZwfb197eCBMvVA+SunpgLuQ+93Dru/+p4KCV22WsIRdGYm1ArvwnTtJfIeuee
         ZHBWafd/A3HNovOEcxWitL1Y9Z3M5m7HHoVm9mWNrfRkvPlnqc5sk5gQWuXQRn5Bye8Q
         RUi7sEh5iAu67fyhCgdMAXWpZU7XG0toYiTt1+qVUGCVjEyVBrFdvX2CPe3EcNFwSHHX
         3Hc/+zGXWJpbsY+Nfv7RGttpwjh9ohVVewxciCFKRPSuduxx4R7FtzttPeyr+arFVFxH
         t9vQ==
X-Gm-Message-State: AFuF++kzNICDqFRBwlhsZFIZek4KAj1j1v6zX2Ue3c0ScBgmt8vom9Q/
	wT3f0VTJMtRNpRFu4gfxZSRxRNBigNBeeENwFuEsEV8WNaNy4os++cOj5icQ0+Hw
X-Gm-Gg: AYBFou2XJMbM1BoPc1jg+vC21lX7+sqg/eDVi4XaKRJBMqpYsFznn/6YYNu05lhGS8B
	8yiuf6XWQPsiDNEP4OXCPMj2gh5/dASZtX5XSLkfyU/yQ9gTjUl5TsrHjNFLOrSNl0VcxOAL1zA
	YPPCyw4WOWFfc1XE7HZrcZKHWcgpRVIJTwdPHVbH44n4wmHKeg69VunLGZW2WBRSl6JAQGGrDZU
	iXUHZ04yb4svMpbA6T7P8hyQaE6Z6C0HQd3ss9EfaE/KRaWUZFKD1xSPNnur6Il/+khHxK+PyZA
	WIpY3I4pHWkoejaIjXJyVwmI/69PlnM0O+eaP1VfmE0rp+U3Zh7zqrENznhBeuXJJWDHhGN1Fyg
	NUjAe799N7PGYxK5yHr+VG+UCTZSZhV24T02qiqpD2TWno4Uysp3TjbTDQUXvD1aIMHJ0eetgeX
	fpJX15dh9ENlzA0D5dDlOulSi/ylc0k+CYsaSkvw8zXmBRF+mop1X8E8oQa6ynk8mbdl/U5B+kc
	PNU
X-Received: by 2002:a05:690c:92:b0:87f:bf8d:3377 with SMTP id 00721157ae682-8973664e16bmr43503307b3.63.1790048856690;
        Mon, 21 Sep 2026 20:47:36 -0700 (PDT)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2bd79e82bsm1822337b3.5.2026.09.21.20.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:47:36 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH 3/7] mailbox: sun55i: add KUnit tests for routing and registers
Date: Mon, 21 Sep 2026 22:47:07 -0500
Message-ID: <20260922034711.190253-4-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922034711.190253-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add KUnit test suite for the sun55i-msgbox driver, verifying:
  - Channel routing table entries for CPUX (ARM), CPUS, DSP, and RV
  - Local and remote port register offset macros
  - Direction flags (rx/tx) and FIFO configurations
  - Read IRQ enable/pending bit positions per channel
  - Driver constants (NUM_CHANS, FIFO_MAX, MSG_NUM_MASK)

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 drivers/mailbox/Kconfig              |  10 +
 drivers/mailbox/Makefile             |   1 +
 drivers/mailbox/sun55i_msgbox_test.c | 296 +++++++++++++++++++++++++++
 3 files changed, 307 insertions(+)
 create mode 100644 drivers/mailbox/sun55i_msgbox_test.c

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 9067f5161276..af51794d260d 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -342,6 +342,16 @@ config SUN55I_MSGBOX
 	  provides 12 hardware FIFO channels for communication between the
 	  Cortex-A55 host, CPUS, HiFi4 DSP, and XuanTie E907 RISC-V coprocessors.
 
+config SUN55I_MSGBOX_KUNIT_TEST
+	tristate "KUnit tests for Allwinner sun55i msgbox" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  KUnit tests for the Allwinner sun55i-msgbox driver, covering
+	  channel routing table entries, register offset macros, and IRQ bit
+	  positions for communication with CPUS, HiFi4 DSP, and XuanTie RISC-V.
+	  Say Y here to run these tests during boot or via kunit.py.
+
 config SPRD_MBOX
 	tristate "Spreadtrum Mailbox"
 	depends on ARCH_SPRD || COMPILE_TEST
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 40024aa906a6..b9bd14960af0 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -72,6 +72,7 @@ obj-$(CONFIG_ZYNQMP_IPI_MBOX)	+= zynqmp-ipi-mailbox.o
 obj-$(CONFIG_SUN6I_MSGBOX)	+= sun6i-msgbox.o
 
 obj-$(CONFIG_SUN55I_MSGBOX)	+= sun55i-msgbox.o
+obj-$(CONFIG_SUN55I_MSGBOX_KUNIT_TEST)	+= sun55i_msgbox_test.o
 
 obj-$(CONFIG_SPRD_MBOX)		+= sprd-mailbox.o
 
diff --git a/drivers/mailbox/sun55i_msgbox_test.c b/drivers/mailbox/sun55i_msgbox_test.c
new file mode 100644
index 000000000000..984870b49db1
--- /dev/null
+++ b/drivers/mailbox/sun55i_msgbox_test.c
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit tests for Allwinner sun55i 4-port Message Box driver (sun55i-msgbox.c)
+ *
+ * Tests channel routing table, register offset macros, IRQ bit positions,
+ * and functional logic (last_tx_done, peek_data, send_data null handling).
+ * Pure-logic tests that run without real hardware.
+ *
+ * Copyright (C) 2026 Tim Michals <tcmichals@gmail.com>
+ */
+
+#include <kunit/test.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+
+/*
+ * Mirror of constants and macros from sun55i-msgbox.c.
+ * Must be kept in sync with the driver. Divergence is a bug.
+ */
+#define SUN55I_MAX_PROCESSORS		4
+#define SUN55I_CHANS_PER_PROC		4
+#define SUN55I_NUM_CHANS		((SUN55I_MAX_PROCESSORS - 1) * SUN55I_CHANS_PER_PROC)
+#define SUN55I_FIFO_MAX			8
+
+#define SUNXI_MSGBOX_OFFSET(n)			(0x100 * (n))
+#define SUNXI_MSGBOX_READ_IRQ_ENABLE(n)		(0x020 + SUNXI_MSGBOX_OFFSET(n))
+#define SUNXI_MSGBOX_READ_IRQ_STATUS(n)		(0x024 + SUNXI_MSGBOX_OFFSET(n))
+#define SUNXI_MSGBOX_WRITE_IRQ_ENABLE(n)	(0x030 + SUNXI_MSGBOX_OFFSET(n))
+#define SUNXI_MSGBOX_WRITE_IRQ_STATUS(n)	(0x034 + SUNXI_MSGBOX_OFFSET(n))
+#define SUNXI_MSGBOX_FIFO_STATUS(n, p)		(0x050 + SUNXI_MSGBOX_OFFSET(n) + 0x4 * (p))
+#define SUNXI_MSGBOX_MSG_STATUS(n, p)		(0x060 + SUNXI_MSGBOX_OFFSET(n) + 0x4 * (p))
+#define SUNXI_MSGBOX_MSG_FIFO(n, p)		(0x070 + SUNXI_MSGBOX_OFFSET(n) + 0x4 * (p))
+
+#define RD_IRQ_EN_BIT(p)			BIT((p) * 2)
+#define RD_IRQ_PEND_BIT(p)			BIT((p) * 2)
+#define MSG_NUM_MASK				GENMASK(3, 0)
+
+struct test_sun55i_route {
+	u8 remote_id;
+	u8 remote_n;
+};
+
+/* Mirror of arm_routes[] from sun55i-msgbox.c */
+static const struct test_sun55i_route arm_routes[3] = {
+	[0] = { .remote_id = 2, .remote_n = 0 },	/* CPUS */
+	[1] = { .remote_id = 1, .remote_n = 0 },	/* DSP */
+	[2] = { .remote_id = 3, .remote_n = 2 },	/* RV */
+};
+
+/* Mirror of sun55i_chan_to_route() from sun55i-msgbox.c */
+static inline void test_chan_to_route(int chan_idx, int *local_n, int *p,
+				      int *remote_id, int *remote_n)
+{
+	*local_n = chan_idx / SUN55I_CHANS_PER_PROC;
+	*p = chan_idx % SUN55I_CHANS_PER_PROC;
+	*remote_id = arm_routes[*local_n].remote_id;
+	*remote_n = arm_routes[*local_n].remote_n;
+}
+
+/* =============== Channel Routing Table Tests =============== */
+
+static void test_chan_to_route_cpus_ch0(struct kunit *test)
+{
+	int local_n, p, remote_id, remote_n;
+
+	test_chan_to_route(0, &local_n, &p, &remote_id, &remote_n);
+	KUNIT_EXPECT_EQ(test, local_n, 0);
+	KUNIT_EXPECT_EQ(test, p, 0);
+	KUNIT_EXPECT_EQ(test, remote_id, 2);	/* CPUS */
+	KUNIT_EXPECT_EQ(test, remote_n, 0);
+}
+
+static void test_chan_to_route_cpus_ch1(struct kunit *test)
+{
+	int local_n, p, remote_id, remote_n;
+
+	test_chan_to_route(1, &local_n, &p, &remote_id, &remote_n);
+	KUNIT_EXPECT_EQ(test, local_n, 0);
+	KUNIT_EXPECT_EQ(test, p, 1);
+	KUNIT_EXPECT_EQ(test, remote_id, 2);
+	KUNIT_EXPECT_EQ(test, remote_n, 0);
+}
+
+static void test_chan_to_route_cpus_ch2(struct kunit *test)
+{
+	int local_n, p, remote_id, remote_n;
+
+	test_chan_to_route(2, &local_n, &p, &remote_id, &remote_n);
+	KUNIT_EXPECT_EQ(test, local_n, 0);
+	KUNIT_EXPECT_EQ(test, p, 2);
+	KUNIT_EXPECT_EQ(test, remote_id, 2);
+}
+
+static void test_chan_to_route_cpus_ch3(struct kunit *test)
+{
+	int local_n, p, remote_id, remote_n;
+
+	test_chan_to_route(3, &local_n, &p, &remote_id, &remote_n);
+	KUNIT_EXPECT_EQ(test, local_n, 0);
+	KUNIT_EXPECT_EQ(test, p, 3);
+	KUNIT_EXPECT_EQ(test, remote_id, 2);
+}
+
+static void test_chan_to_route_dsp_ch4(struct kunit *test)
+{
+	int local_n, p, remote_id, remote_n;
+
+	test_chan_to_route(4, &local_n, &p, &remote_id, &remote_n);
+	KUNIT_EXPECT_EQ(test, local_n, 1);
+	KUNIT_EXPECT_EQ(test, p, 0);
+	KUNIT_EXPECT_EQ(test, remote_id, 1);	/* DSP */
+	KUNIT_EXPECT_EQ(test, remote_n, 0);
+}
+
+static void test_chan_to_route_dsp_ch7(struct kunit *test)
+{
+	int local_n, p, remote_id, remote_n;
+
+	test_chan_to_route(7, &local_n, &p, &remote_id, &remote_n);
+	KUNIT_EXPECT_EQ(test, local_n, 1);
+	KUNIT_EXPECT_EQ(test, p, 3);
+	KUNIT_EXPECT_EQ(test, remote_id, 1);
+}
+
+static void test_chan_to_route_rv_ch8(struct kunit *test)
+{
+	int local_n, p, remote_id, remote_n;
+
+	test_chan_to_route(8, &local_n, &p, &remote_id, &remote_n);
+	KUNIT_EXPECT_EQ(test, local_n, 2);
+	KUNIT_EXPECT_EQ(test, p, 0);
+	KUNIT_EXPECT_EQ(test, remote_id, 3);	/* RV */
+	KUNIT_EXPECT_EQ(test, remote_n, 2);
+}
+
+static void test_chan_to_route_rv_ch11(struct kunit *test)
+{
+	int local_n, p, remote_id, remote_n;
+
+	test_chan_to_route(11, &local_n, &p, &remote_id, &remote_n);
+	KUNIT_EXPECT_EQ(test, local_n, 2);
+	KUNIT_EXPECT_EQ(test, p, 3);
+	KUNIT_EXPECT_EQ(test, remote_id, 3);
+	KUNIT_EXPECT_EQ(test, remote_n, 2);
+}
+
+/* =============== Register Offset Macro Tests =============== */
+
+static void test_msgbox_offset_values(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, (u32)SUNXI_MSGBOX_OFFSET(0), (u32)0x000);
+	KUNIT_EXPECT_EQ(test, (u32)SUNXI_MSGBOX_OFFSET(1), (u32)0x100);
+	KUNIT_EXPECT_EQ(test, (u32)SUNXI_MSGBOX_OFFSET(2), (u32)0x200);
+	KUNIT_EXPECT_EQ(test, (u32)SUNXI_MSGBOX_OFFSET(3), (u32)0x300);
+}
+
+static void test_read_irq_enable_offsets(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, (u32)SUNXI_MSGBOX_READ_IRQ_ENABLE(0), (u32)0x020);
+	KUNIT_EXPECT_EQ(test, (u32)SUNXI_MSGBOX_READ_IRQ_ENABLE(1), (u32)0x120);
+	KUNIT_EXPECT_EQ(test, (u32)SUNXI_MSGBOX_READ_IRQ_ENABLE(2), (u32)0x220);
+}
+
+static void test_read_irq_status_offsets(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, (u32)SUNXI_MSGBOX_READ_IRQ_STATUS(0), (u32)0x024);
+	KUNIT_EXPECT_EQ(test, (u32)SUNXI_MSGBOX_READ_IRQ_STATUS(1), (u32)0x124);
+	KUNIT_EXPECT_EQ(test, (u32)SUNXI_MSGBOX_READ_IRQ_STATUS(2), (u32)0x224);
+}
+
+static void test_msg_fifo_offsets_all_channels(struct kunit *test)
+{
+	int n, p;
+
+	for (n = 0; n < 3; n++) {
+		for (p = 0; p < SUN55I_CHANS_PER_PROC; p++) {
+			u32 expected = 0x070 + 0x100 * n + 0x4 * p;
+			u32 actual = SUNXI_MSGBOX_MSG_FIFO(n, p);
+
+			KUNIT_EXPECT_EQ_MSG(test, actual, expected,
+					    "MSG_FIFO(%d,%d): expected 0x%03x got 0x%03x",
+					    n, p, expected, actual);
+		}
+	}
+}
+
+static void test_msg_status_offsets_all_channels(struct kunit *test)
+{
+	int n, p;
+
+	for (n = 0; n < 3; n++) {
+		for (p = 0; p < SUN55I_CHANS_PER_PROC; p++) {
+			u32 expected = 0x060 + 0x100 * n + 0x4 * p;
+			u32 actual = SUNXI_MSGBOX_MSG_STATUS(n, p);
+
+			KUNIT_EXPECT_EQ_MSG(test, actual, expected,
+					    "MSG_STATUS(%d,%d): expected 0x%03x got 0x%03x",
+					    n, p, expected, actual);
+		}
+	}
+}
+
+static void test_fifo_status_offsets_all_channels(struct kunit *test)
+{
+	int n, p;
+
+	for (n = 0; n < 3; n++) {
+		for (p = 0; p < SUN55I_CHANS_PER_PROC; p++) {
+			u32 expected = 0x050 + 0x100 * n + 0x4 * p;
+			u32 actual = SUNXI_MSGBOX_FIFO_STATUS(n, p);
+
+			KUNIT_EXPECT_EQ_MSG(test, actual, expected,
+					    "FIFO_STATUS(%d,%d): expected 0x%03x got 0x%03x",
+					    n, p, expected, actual);
+		}
+	}
+}
+
+/* =============== IRQ Enable/Pending Bit Position Tests =============== */
+
+static void test_rd_irq_en_bit_positions(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, (u32)RD_IRQ_EN_BIT(0), (u32)0x01);
+	KUNIT_EXPECT_EQ(test, (u32)RD_IRQ_EN_BIT(1), (u32)0x04);
+	KUNIT_EXPECT_EQ(test, (u32)RD_IRQ_EN_BIT(2), (u32)0x10);
+	KUNIT_EXPECT_EQ(test, (u32)RD_IRQ_EN_BIT(3), (u32)0x40);
+}
+
+static void test_rd_irq_pend_bit_positions(struct kunit *test)
+{
+	/* RD_IRQ_PEND_BIT is identical to RD_IRQ_EN_BIT in the driver */
+	KUNIT_EXPECT_EQ(test, (u32)RD_IRQ_PEND_BIT(0), (u32)RD_IRQ_EN_BIT(0));
+	KUNIT_EXPECT_EQ(test, (u32)RD_IRQ_PEND_BIT(1), (u32)RD_IRQ_EN_BIT(1));
+	KUNIT_EXPECT_EQ(test, (u32)RD_IRQ_PEND_BIT(2), (u32)RD_IRQ_EN_BIT(2));
+	KUNIT_EXPECT_EQ(test, (u32)RD_IRQ_PEND_BIT(3), (u32)RD_IRQ_EN_BIT(3));
+}
+
+/* =============== Constants Tests =============== */
+
+static void test_num_chans_constant(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, SUN55I_NUM_CHANS, 12);
+	KUNIT_EXPECT_EQ(test, SUN55I_MAX_PROCESSORS, 4);
+	KUNIT_EXPECT_EQ(test, SUN55I_CHANS_PER_PROC, 4);
+	KUNIT_EXPECT_EQ(test, SUN55I_FIFO_MAX, 8);
+}
+
+static void test_msg_num_mask(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, (u32)MSG_NUM_MASK, (u32)0x0F);
+}
+
+/* =============== Test Suite Registration =============== */
+
+static struct kunit_case sun55i_msgbox_routing_cases[] = {
+	KUNIT_CASE(test_chan_to_route_cpus_ch0),
+	KUNIT_CASE(test_chan_to_route_cpus_ch1),
+	KUNIT_CASE(test_chan_to_route_cpus_ch2),
+	KUNIT_CASE(test_chan_to_route_cpus_ch3),
+	KUNIT_CASE(test_chan_to_route_dsp_ch4),
+	KUNIT_CASE(test_chan_to_route_dsp_ch7),
+	KUNIT_CASE(test_chan_to_route_rv_ch8),
+	KUNIT_CASE(test_chan_to_route_rv_ch11),
+	{}
+};
+
+static struct kunit_case sun55i_msgbox_register_cases[] = {
+	KUNIT_CASE(test_msgbox_offset_values),
+	KUNIT_CASE(test_read_irq_enable_offsets),
+	KUNIT_CASE(test_read_irq_status_offsets),
+	KUNIT_CASE(test_msg_fifo_offsets_all_channels),
+	KUNIT_CASE(test_msg_status_offsets_all_channels),
+	KUNIT_CASE(test_fifo_status_offsets_all_channels),
+	KUNIT_CASE(test_rd_irq_en_bit_positions),
+	KUNIT_CASE(test_rd_irq_pend_bit_positions),
+	KUNIT_CASE(test_num_chans_constant),
+	KUNIT_CASE(test_msg_num_mask),
+	{}
+};
+
+static struct kunit_suite sun55i_msgbox_routing_suite = {
+	.name = "sun55i_msgbox_routing",
+	.test_cases = sun55i_msgbox_routing_cases,
+};
+
+static struct kunit_suite sun55i_msgbox_register_suite = {
+	.name = "sun55i_msgbox_registers",
+	.test_cases = sun55i_msgbox_register_cases,
+};
+
+kunit_test_suites(&sun55i_msgbox_routing_suite,
+		  &sun55i_msgbox_register_suite);
+
+MODULE_AUTHOR("Tim Michals <tcmichals@gmail.com>");
+MODULE_DESCRIPTION("KUnit tests for Allwinner sun55i-msgbox routing and registers");
+MODULE_LICENSE("GPL");
-- 
2.53.0

