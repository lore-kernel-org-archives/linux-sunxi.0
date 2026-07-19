Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EED3128B8
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 21:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495629; cv=none; b=ZT7mhsDvAmzJAGHnBXQDYZz+3jRUhKPIm2hOmKztPtxluHZov+fDTtE1sOe4PqwqMerpsq4fMWP++2F212JVrihMhRtum7n6FRVyaUpc/YMOU6vUD64MKQEyjUw1k0AC5Zod+rHL2LR2htYbx3koAqudiSrao64P7ji/wZsC2ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495629; c=relaxed/simple;
	bh=FrJNlJDuje1fraZreQFeA7K8hMC+23M50saNKQjdz30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tr+ziNTe6MJ57YuE2AZK7VSdNFkPCj3dE8ivUMZhNV5TNhcOhyYNhe9osELZIh5kbJGgIGuYF2b1DYywJOIAnjSr5NAduiM+ARKO3G5Ur3LILJrCz+WOL02h2x+y5TEbUSGaXbnlXlCSOuM1HoafNtezcm4N2R+2bn0dbSlEa9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ti9SZ8Wx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ti9SZ8Wx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so10481975e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 14:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495626; x=1785100426; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v7CaPFCYxjAp666DnXxZML+uPeZM+JIvYLGcdU4j6/g=;
        b=Ti9SZ8Wx6St0sPL0ryGNte7BDONiWLUP68D0Ew9nSs3WsIxt7+uIP5KlEQG4zKr8SL
         tWlTtnA5eKll0reTxWEf8XCqrGC6wyIqqHxYNDq/phgiGVqTJKVGuAJmK3JJFVq4SHQY
         4a8UpBSRKyD3qWkxzEwsl4F63gV6K7Vxicu+vqqbXBXSgin4rtONgNBQEBDZ0QI6oxq2
         0NcpDVEqB7OHQyacIq++fFlb42aQcMxhTzsNng54H7fLrG6HsnHtr1A/121MRjb7pwbo
         cRIopQhu2s4Y3SwrDbKS2dekmfNmbf87QMrh2cFUKMhq6g0geZ1u+0Br6+7YQByz/tK3
         ahJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495626; x=1785100426;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7CaPFCYxjAp666DnXxZML+uPeZM+JIvYLGcdU4j6/g=;
        b=Jovb3M3UD+F0OX8a+6I+gSCss9fjtra9LsKpXla0yk6GSz+497lmqXEAtvN+FAuFHz
         pr1YrF1ocrzloJmEIMkpSSFPfR90oIEgl7Zez7P6gVlrji6mpi56iqNMUxb4BNVR8bA0
         bxiTjZHFEBdrdBU6iQu0RbB7+7cVqePJTgBnnR8Uv3ZDj7Jcd+HBYXNLR8OtkLUhggsN
         Yzp3lTR/T/YVElvr9iw3yt4wijFoxBjHzBzO9cfr4mDok1OQy6oTxv+uxRcrB6p/xHu3
         wK9fS+4BZidxJ4QdjnqyknolngFI85q8Tp15x5gJXT8MnO4ZnNF0VQcOWWiNw/PJlanv
         7G/g==
X-Forwarded-Encrypted: i=1; AHgh+Rr9qWZHrXtDyt67vHRyoLRZzxRR/uYq7VhqbiMgyekzAzPv4nnbC6psmvzr6gyfyHb+0X2L8sxv3m35iQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwXn0AA0nsrV9klCi5OwEMYINYp6pBPr7dUYk6agguLjYIKihA
	oLEOQxoh6OtocZN/rAxmwk1rxjBSm1cmPy5vEJXVXenfqpCH/xSAPG1r
X-Gm-Gg: AfdE7ckmKBnNiexgZAMhIUg+WK3AUrHR3/au1i1hHYRw8d9R3ybE/gKbMgZq9pkBt+5
	29KIDB12zJ1OWPrtl2z+0n2jbBNs0Wmv5Px146Hcel0NQkrIIIyjeLTPKX3vvvMsLf0AIJQlmmC
	3J0kxibDbGAsszZBbpioD+sguAsdC9PnVEVat5XFIPyApmxLGyx2LPMEaBTEbdtYCv9DTXIjsah
	waXGsWxVMYaNjmb6vnn0SvyHLuCuntc5d3Oxxx2LG4/pWbjknsyM/8DR2euZs86ndJsv+Vwtnlo
	CSUydi5YWpFDBFqpAtY8qS1Z78Y23DTZWpzMFj+KwfOhpZot/1l2X/JsxADXLIdY9bQef8c5fgy
	1o1UFy+BFm7WsB7fKTfTd3ZeTczsHFs3YrKWDAthXKLPlS7Wo8Gmyz3D7jJVuq5wA/45I++iUHo
	RdQGTWAAezZ/jS9Q5zqHdgjPMT0RDGlP3N84CwFlMH3eZ2h9o=
X-Received: by 2002:a05:600c:1906:b0:495:3bc6:d381 with SMTP id 5b1f17b1804b1-4954affd764mr114277385e9.2.1784495625577;
        Sun, 19 Jul 2026 14:13:45 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm224108815e9.4.2026.07.19.14.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:13:44 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v1 1/4] clk: sunxi-ng: add cycle-masking divider (maskdiv) clock type
Date: Sun, 19 Jul 2026 23:13:16 +0200
Message-ID: <20260719211319.982285-2-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
References: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some mod clocks do not divide their parent with a linear M+1 divider:
the M factor masks (swallows) M pulses out of every 2^width parent
cycles, so the average output rate is

	rate = parent * (2^width - M) / 2^width

and the surviving pulses keep the parent period.  The A523/T527 GPU
clock (GPU_CLK_REG, 0x670) is such a divider: "FACTOR_M: mask M cycles
at 16 cycles", GPU_CLK = Clock Source * ((16-M)/16) (T527 user manual
v0.92, section 2.7.6.58).

Modelling these registers with the linear ccu_div type programs a
faster clock than requested for every M > 0 (e.g. M=1 on a 800 MHz
parent yields 750 MHz, not 400 MHz).

Add a small ccu type implementing the masking semantics.  Because the
masked output is not an even pulse train, determine_rate prefers, among
the parents that reach the requested rate, the one needing the least
masking.  set_rate_and_parent follows the same ordering rule as
clk_composite_set_rate_and_parent() so no intermediate configuration
overshoots both the old and the new rate.

Signed-off-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>
---
 drivers/clk/sunxi-ng/Makefile      |   1 +
 drivers/clk/sunxi-ng/ccu_maskdiv.c | 199 +++++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_maskdiv.h |  71 ++++++++++
 3 files changed, 271 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu_maskdiv.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_maskdiv.h

diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
index a1c4087d7..26313083c 100644
--- a/drivers/clk/sunxi-ng/Makefile
+++ b/drivers/clk/sunxi-ng/Makefile
@@ -10,6 +10,7 @@ sunxi-ccu-y			+= ccu_reset.o
 # Base clock types
 sunxi-ccu-y			+= ccu_div.o
 sunxi-ccu-y			+= ccu_frac.o
+sunxi-ccu-y			+= ccu_maskdiv.o
 sunxi-ccu-y			+= ccu_gate.o
 sunxi-ccu-y			+= ccu_mux.o
 sunxi-ccu-y			+= ccu_mult.o
diff --git a/drivers/clk/sunxi-ng/ccu_maskdiv.c b/drivers/clk/sunxi-ng/ccu_maskdiv.c
new file mode 100644
index 000000000..2d3cccf08
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu_maskdiv.c
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2026 Juan Manuel López Carrillo
+ *
+ * Cycle-masking divider: the M factor masks M pulses out of every
+ * 2^width parent cycles instead of dividing the parent rate, so
+ *
+ *	rate = parent * (2^width - M) / 2^width
+ *
+ * The masked output is not an even pulse train: the surviving pulses
+ * keep the parent period. Rate selection therefore prefers, among the
+ * parents that reach the requested rate, the one needing the least
+ * masking.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/math64.h>
+
+#include "ccu_gate.h"
+#include "ccu_maskdiv.h"
+
+static unsigned long ccu_maskdiv_calc_rate(unsigned long parent_rate,
+					   unsigned int m, unsigned int width)
+{
+	unsigned int n = 1 << width;
+
+	return div_u64((u64)parent_rate * (n - m), n);
+}
+
+/*
+ * Smallest M (least masking) whose output does not exceed the requested
+ * rate; masking everything (M == 2^width) is never returned.
+ */
+static unsigned int ccu_maskdiv_find_m(unsigned long parent_rate,
+				       unsigned long rate, unsigned int width)
+{
+	unsigned int n = 1 << width;
+	u64 kept;
+
+	if (!parent_rate || rate >= parent_rate)
+		return 0;
+
+	kept = div64_ul((u64)rate * n, parent_rate);
+	if (!kept)
+		kept = 1;
+
+	return n - (unsigned int)kept;
+}
+
+static void ccu_maskdiv_disable(struct clk_hw *hw)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+
+	return ccu_gate_helper_disable(&cmd->common, cmd->enable);
+}
+
+static int ccu_maskdiv_enable(struct clk_hw *hw)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+
+	return ccu_gate_helper_enable(&cmd->common, cmd->enable);
+}
+
+static int ccu_maskdiv_is_enabled(struct clk_hw *hw)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+
+	return ccu_gate_helper_is_enabled(&cmd->common, cmd->enable);
+}
+
+static unsigned long ccu_maskdiv_recalc_rate(struct clk_hw *hw,
+					     unsigned long parent_rate)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+	unsigned int m;
+	u32 reg;
+
+	reg = readl(cmd->common.base + cmd->common.reg);
+	m = (reg >> cmd->shift) & ((1 << cmd->width) - 1);
+
+	return ccu_maskdiv_calc_rate(parent_rate, m, cmd->width);
+}
+
+static int ccu_maskdiv_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+	unsigned long best_rate = 0, best_parent_rate = 0;
+	struct clk_hw *best_parent = NULL;
+	unsigned int best_m = UINT_MAX;
+	unsigned int i;
+
+	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
+		struct clk_hw *parent = clk_hw_get_parent_by_index(hw, i);
+		unsigned long parent_rate, new_rate;
+		unsigned int m;
+
+		if (!parent)
+			continue;
+
+		parent_rate = clk_hw_get_rate(parent);
+		m = ccu_maskdiv_find_m(parent_rate, req->rate, cmd->width);
+		new_rate = ccu_maskdiv_calc_rate(parent_rate, m, cmd->width);
+
+		if (new_rate > req->rate)
+			continue;
+
+		/* Closest rate first; on ties, the least masking */
+		if (new_rate > best_rate ||
+		    (new_rate == best_rate && m < best_m)) {
+			best_rate = new_rate;
+			best_parent_rate = parent_rate;
+			best_parent = parent;
+			best_m = m;
+		}
+	}
+
+	if (!best_parent)
+		return -EINVAL;
+
+	req->best_parent_hw = best_parent;
+	req->best_parent_rate = best_parent_rate;
+	req->rate = best_rate;
+
+	return 0;
+}
+
+static int ccu_maskdiv_set_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+	unsigned int m;
+	unsigned long flags;
+	u32 reg;
+
+	m = ccu_maskdiv_find_m(parent_rate, rate, cmd->width);
+
+	spin_lock_irqsave(cmd->common.lock, flags);
+
+	reg = readl(cmd->common.base + cmd->common.reg);
+	reg &= ~GENMASK(cmd->shift + cmd->width - 1, cmd->shift);
+	writel(reg | (m << cmd->shift), cmd->common.base + cmd->common.reg);
+
+	spin_unlock_irqrestore(cmd->common.lock, flags);
+
+	return 0;
+}
+
+static u8 ccu_maskdiv_get_parent(struct clk_hw *hw)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+
+	return ccu_mux_helper_get_parent(&cmd->common, &cmd->mux);
+}
+
+static int ccu_maskdiv_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct ccu_maskdiv *cmd = hw_to_ccu_maskdiv(hw);
+
+	return ccu_mux_helper_set_parent(&cmd->common, &cmd->mux, index);
+}
+
+static int ccu_maskdiv_set_rate_and_parent(struct clk_hw *hw,
+					   unsigned long rate,
+					   unsigned long parent_rate, u8 index)
+{
+	/*
+	 * Same ordering rule as clk_composite_set_rate_and_parent(): if
+	 * switching the mux with the current M would overshoot the
+	 * requested rate, program the divider first, so the
+	 * intermediate rate never exceeds both the old and the new
+	 * rate.
+	 */
+	if (ccu_maskdiv_recalc_rate(hw, parent_rate) > rate) {
+		ccu_maskdiv_set_rate(hw, rate, parent_rate);
+		ccu_maskdiv_set_parent(hw, index);
+	} else {
+		ccu_maskdiv_set_parent(hw, index);
+		ccu_maskdiv_set_rate(hw, rate, parent_rate);
+	}
+
+	return 0;
+}
+
+const struct clk_ops ccu_maskdiv_ops = {
+	.disable	= ccu_maskdiv_disable,
+	.enable		= ccu_maskdiv_enable,
+	.is_enabled	= ccu_maskdiv_is_enabled,
+
+	.get_parent	= ccu_maskdiv_get_parent,
+	.set_parent	= ccu_maskdiv_set_parent,
+
+	.determine_rate	= ccu_maskdiv_determine_rate,
+	.recalc_rate	= ccu_maskdiv_recalc_rate,
+	.set_rate	= ccu_maskdiv_set_rate,
+	.set_rate_and_parent = ccu_maskdiv_set_rate_and_parent,
+};
+EXPORT_SYMBOL_NS_GPL(ccu_maskdiv_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_maskdiv.h b/drivers/clk/sunxi-ng/ccu_maskdiv.h
new file mode 100644
index 000000000..3cbfce064
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu_maskdiv.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 Juan Manuel López Carrillo
+ */
+
+#ifndef _CCU_MASKDIV_H_
+#define _CCU_MASKDIV_H_
+
+#include <linux/clk-provider.h>
+
+#include "ccu_common.h"
+#include "ccu_mux.h"
+
+/*
+ * struct ccu_maskdiv - cycle-masking ("fractional") divider
+ *
+ * This divider does not divide the parent clock: it masks (swallows) M
+ * pulses out of every 2^width parent cycles, so the average output rate
+ * is
+ *
+ *	rate = parent * (2^width - M) / 2^width
+ *
+ * with the remaining pulses keeping the parent period. The A523/T527
+ * GPU clock (GPU_CLK_REG, 0x670) is such a divider: "FACTOR_M: mask M
+ * cycles at 16 cycles", GPU_CLK = Clock Source * ((16-M)/16) (T527 user
+ * manual v0.92, section 2.7.6.58).
+ *
+ * @shift:	shift of the M field in the register
+ * @width:	width of the M field; the mask window is 2^width cycles
+ */
+struct ccu_maskdiv {
+	u32			enable;
+
+	u8			shift;
+	u8			width;
+
+	struct ccu_mux_internal	mux;
+	struct ccu_common	common;
+};
+
+#define SUNXI_CCU_MASKDIV_HW_WITH_MUX_TABLE_GATE(_struct, _name,	\
+						 _parents, _table,	\
+						 _reg,			\
+						 _mshift, _mwidth,	\
+						 _muxshift, _muxwidth,	\
+						 _gate, _flags)		\
+	struct ccu_maskdiv _struct = {					\
+		.enable	= _gate,					\
+		.shift	= _mshift,					\
+		.width	= _mwidth,					\
+		.mux	= _SUNXI_CCU_MUX_TABLE(_muxshift, _muxwidth,	\
+					       _table),			\
+		.common	= {						\
+			.reg		= _reg,				\
+			.hw.init	= CLK_HW_INIT_PARENTS_HW(_name,	\
+								 _parents, \
+								 &ccu_maskdiv_ops, \
+								 _flags), \
+		},							\
+	}
+
+static inline struct ccu_maskdiv *hw_to_ccu_maskdiv(struct clk_hw *hw)
+{
+	struct ccu_common *common = hw_to_ccu_common(hw);
+
+	return container_of(common, struct ccu_maskdiv, common);
+}
+
+extern const struct clk_ops ccu_maskdiv_ops;
+
+#endif /* _CCU_MASKDIV_H_ */
-- 
2.47.3

