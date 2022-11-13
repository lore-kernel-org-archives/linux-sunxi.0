Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21897E5
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Nov 2022 22:32:08 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id B93555C00A9;
	Sun, 13 Nov 2022 17:32:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 13 Nov 2022 17:32:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1668378727; x=
	1668465127; bh=D0UDPOcJzT1RD0W0b6Z42Zcs34D8+nlMSqsxaHZ8s4c=; b=G
	bue/7XmTaxL+fotI1cBfc0OkeDdpw4W8BtHH6JVQ4XCT1wiwX+957v3rQQRvb3fP
	P4cWNpmf4XNxD46NBbdzUgO6WjOvB90Q62JIPnCv72M/87PBYgLfpANQiDhbMcEt
	65lmqINiagjIsRmJy9p9I9JMDhgxX45NX7PvIu+bUdetJ3+YWCqT1w1BTL3lqNhA
	75fy6vrVGTC1P3SnXLIVv4mnlmtyMcqW4zew8PCZssy52LwIpuADafu2feSj8zLq
	VJfdZjtyqcH3pCSngZrCx7inMh48doGUcjEdJr/mZpbCNPbEeA7UbAw0DwSeChBY
	4aNGTOppRgvW7v0YdZZGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668378727; x=
	1668465127; bh=D0UDPOcJzT1RD0W0b6Z42Zcs34D8+nlMSqsxaHZ8s4c=; b=a
	nb+ypKQbTHUP1Nibk45YU4XBzrt6WwCBU9uEiKxaaDze7rmGH4SCw1MIAp4wnfQA
	TG3WzsD7TGMTLT0YRlzmEZFLdgO4CGiU50R9zPrffvzeuBNGnc6sjkXPAP32arcn
	DR/G4cwvNb/CKiJTLyM9K/vo6NEz2fiLAju5mxcnxBy72HS3oi9sZdA0bQ68Xi6x
	S19JGhNa7hfuiLheEO07FFgfUL5dtLpaugiNCrv5MqxwzmdpiRsB8JPx/EK4iCKx
	oiSkr4SWZOErm6Ex7cbJURRUjlF+9Hzmr9mtIbgml98mOaZMPqpf6Quk96z57hJA
	viumyG0xPJiz+fdsECZVA==
X-ME-Sender: <xms:Z3BxY6sNlWRNXoJ0Uk_EsOMxRDO5QjiTyx7gp7TmVkOTsYl9V50rKQ>
    <xme:Z3BxY_ePWOm4O-fz6PRTTJvJH6mFYa2wufmtIwpWLbtn3fWUhl6bikG6Fezi4WoZC
    MF-8z_Fxt-jqQUCcg>
X-ME-Received: <xmr:Z3BxY1yOIc2cRUWSykAQHsoED1lPSPRiiAxiawUEnxriafk2DnKSuCvOKR49Va2zFWOnmfOq1OBV5pnSkSbFsglMLcM0cnV33VKztR7Qj2KC_CM1E53Lfx4RrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedtgdduieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeekjeelleefiedthfdtgfekgeehudefudeugeffvdfhudekleel
    fedtteejhedutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:Z3BxY1Ox48ZDy-gRZWa2cXiBYSqqBG-hduR7JOCw58BMJzqf5K9aeg>
    <xmx:Z3BxY6_WCu_QxiKm8f_NX9NWb2oEaOgzr33bpZZhbdyoCNEY0BV8uQ>
    <xmx:Z3BxY9U-ubDYE8EEYjXnJePxrgsW2A2VSEzuDTHOvAiKDN2PTkJBUQ>
    <xmx:Z3BxY1UscQ742TzqufOkY6b8RkpYRN5fe4n-zZjw2Fa8F345IC2org>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Nov 2022 17:32:06 -0500 (EST)
Message-ID: <5c909a91-ced8-8a86-1385-f7d3bca00fc4@sholland.org>
Date: Sun, 13 Nov 2022 16:32:04 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 01/11] dt-bindings: phy: add binding document for
 Allwinner F1C100s USB PHY
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Icenowy Zheng <uwu@icenowy.me>
Cc: soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 Rob Herring <robh@kernel.org>
References: <20221106154826.6687-1-andre.przywara@arm.com>
 <20221106154826.6687-2-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20221106154826.6687-2-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/6/22 09:48, Andre Przywara wrote:
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> Allwinner F1C100s has the most simple USB PHY among all Allwinner SoCs,
> because it has only one OTG USB controller, no host-only OHCI/EHCI
> controllers.
> 
> Add a binding document for it. Following the current situation of one
> YAML file per SoC, this one is based on
> allwinner,sun8i-v3s-usb-phy.yaml, but with OHCI/EHCI-related bits
> removed. (The same driver in Linux, phy-sun4i-usb, covers all these
> binding files now.)
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../phy/allwinner,suniv-f1c100s-usb-phy.yaml  | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/allwinner,suniv-f1c100s-usb-phy.yaml

Reviewed-by: Samuel Holland <samuel@sholland.org>

