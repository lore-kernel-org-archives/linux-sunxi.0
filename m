Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764792;
	b=l0zrUpbRKKOwDwCSGKalMP0iLH0GOsNdhy+Dhw0fJ8eAfIUZ4g9l6TipXg2i16X2dmEk
	 iMEQjltIvWYolajzeXf02zXPo1e5S5lEBmqr92R21N11zpOm8PntjAevPOpgNn7kh8LSl
	 SK9BaLOWrT7j4Ofql2lWgPr3SdG4tXv6jMHNPqdo2hM9tWFhLfNEUVRMtHspiTtgAYBsn
	 StqXvlDeiHLArcvOg2SjHHepzVg0Sko4mhpUUaFKHf47wpLLGAc38Vgzn+cK4fij1xCPK
	 yP8Wnos8Xn2oPy2ByotGBqQmriXpszV1SWW0J/8PsJ6Gx0CWzurRVc6G096wrxXr8Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764792;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HrJaQ4IGLrTeqJ8I6ef+9LA4sxmOsqML/877ZscWApY=;
	b=kj0/SjV3X6aN47ONsWiJSmE78Oy+IvRzGr81fXp8xfSyiFPtjZb9BZkzC6o57vRkI33S
	 JDr4y7XUGNX7rCcek2kkvrXL+aZoKmnvnDsaz8CDkU+YzQvtl3CGyzUhGTX5yeDJUNHNW
	 s/6iZfGRREaDirmXLVoAvb0fr5fjhn340GRu8R2fT9rTWWqG/3fbAW0aJ/fZNkYAoFp7y
	 23iDtMXq4PX74XQnK30zerHnqH/q6t6zHr6eOaplE7wZg8VdKUpGOioc5R0fMJNHdYDdS
	 vVs/Xucv/X5WbYCpLTj0eQSI3H9VA4nlNvfRpuYZ97Ew0zWydCqjWHgLVNXT5Dy0icQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=pOnXL6HE;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B05606A33E
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 07:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6B05606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=pOnXL6HE
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 111994C970;
	Fri, 27 Nov 2026 18:33:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795764783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HrJaQ4IGLrTeqJ8I6ef+9LA4sxmOsqML/877ZscWApY=;
	b=pOnXL6HEVb1YWk1+ScGANAZ3AjUNnpSk/GVj54FmAG4l95a6pglNkG6dTFLokhXxqTRyDo
	tI32ohAUHF71QIASwej0tSDJyihhBW8osYU3jtbc7x60eBTb13Kmcn5bHjB1Ys09q31anq
	Mx7snKOAH2UCO4eI2ue2B/bmjaGnzdQrJwovX7olDGrK8VuuhoXNv55yVGtjYbxRMq8oIS
	QTrzhMSAGcQ8CS+RR/01z2CLVnbiH/olYzgiEn8hngepESaonfU0vKd8p2EgsV6RIeN3rJ
	MMVEArwH53X2rzr3sZOaFbJoDXAGmq4W1Y+ET3MBUn6FLrDel2rj/PIEv7omhQ==
X-GPT-Reason: This is a legitimate personal/professional communication.
	The email is a technical patch submission regarding a "clk: sunxi-ng" kernel
	update, which matches the sender's domain (alastair@d-silva.org)
	and the intended recipient's domain (alastair@d-silva.org), indicating
	a consistent identity. There are no phishing indicators, no URLs,
	no urgency/scare tactics, and the content is a standard, professional
	software development contribution.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 04/11] clk: sunxi-ng: sun60i-a733: Add USB2 bus and sys clocks
Date: Fri, 27 Nov 2026 18:32:24 +1100
Message-ID: <20261127073231.1776847-5-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127073231.1776847-1-alastair@d-silva.org>
References: <20261127073231.1776847-1-alastair@d-silva.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement CLK_BUS_USB2 and CLK_USB2_SYS gate clocks for the A733 USB 3.0
controller.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
index 958a2a2bcf76..ef22e82a4e05 100644
--- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
@@ -1317,6 +1317,8 @@ static SUNXI_CCU_M_DATA_WITH_MUX_GATE(usb2_mf_clk, "usb2-mf", usb2_mf_utmi_paren
 				      BIT(31),	/* gate */
 				      0);
 
+static SUNXI_CCU_GATE_HWS(bus_usb2_clk, "bus-usb2", ahb_hws, 0x135c, BIT(0), 0);
+
 static SUNXI_CCU_M_DATA_WITH_MUX_GATE(usb2_u3_utmi_clk, "usb2-u3-utmi", usb2_mf_utmi_parents,
 				      0x1360,
 				      0, 5,	/* M */
@@ -1569,6 +1571,8 @@ static SUNXI_CCU_M_HW_WITH_MUX_GATE(isp_clk, "isp", isp_parents, 0x1860,
 
 static SUNXI_CCU_GATE_DATA(res_dcap_24m_clk, "res-dcap-24m", hosc, 0x1a00, BIT(3), 0);
 
+static SUNXI_CCU_GATE_HWS(usb2_sys_clk, "usb2-sys", mbus_hws, 0x1b30, BIT(0), 0);
+
 static const struct clk_parent_data apb2jtag_parents[] = {
 	{ .hw = &sys_24M_clk.hw },
 	{ .fw_name = "losc" },
@@ -1855,6 +1859,8 @@ static struct ccu_common *sun60i_a733_ccu_clks[] = {
 	&usb2_mf_clk.common,
 	&usb2_u3_utmi_clk.common,
 	&usb2_u2_pipe_clk.common,
+	&bus_usb2_clk.common,
+	&usb2_sys_clk.common,
 	&pcie_aux_clk.common,
 	&pcie_axi_slv_clk.common,
 	&serdes_phy_clk.common,
@@ -2189,8 +2195,10 @@ static struct clk_hw_onecell_data sun60i_a733_hw_clks = {
 		[CLK_FANOUT1]		= &fanout1_clk.common.hw,
 		[CLK_FANOUT2]		= &fanout2_clk.common.hw,
 		[CLK_FANOUT3]		= &fanout3_clk.common.hw,
+		[CLK_BUS_USB2]		= &bus_usb2_clk.common.hw,
+		[CLK_USB2_SYS]		= &usb2_sys_clk.common.hw,
 	},
-	.num	= CLK_FANOUT3 + 1,
+	.num	= CLK_USB2_SYS + 1,
 };
 
 static const struct ccu_reset_map sun60i_a733_ccu_resets[] = {
-- 
2.53.0

