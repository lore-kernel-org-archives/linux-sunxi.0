Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788311;
	b=v2HyOLhWdwjYX8FWa3gu08LDlGm2+JSsjgWTH6+lxhjc1ZMQhKymj4tMCQ1Zyzx9Z/Eg
	 E7NhZblmYR2H8gu+pOCkiwefyb5V8b4c3A6/s2dreVF15qWC27gjSOI3vspuan5Xf9ISM
	 CIVOrU2UQL8u2TzXON91bmzigj7ow5of4sHWrVbClSSw+vy1HgIOyf5fXuqSqFl6XuI49
	 jZbarFbx9MmtSCCTj89nVRk3rMtp5iSbMhNTyzkaLk+oY72y4Ql2TOwyLvSVO/f2MALAS
	 m37XWZ69bVWU8zMUXgYDJrp+P6VxjHo0cBrSiP0xIZ3ntoidA/OyfTLy++p01MCLZ+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788311;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Lb3fYY47wnHUevyvaDmgtyRPvaV2N/l1ui/X6FH+mpc=;
	b=yyHg56TaWI7A3Gag6Sa8jPtiZw0SoodIQcakNrkSyLfrprq0J7YYdlelTDLnoeRBUGAK
	 O0VPsEx3W38o66g5pwBYAaglN6Nn2TFkszOPsVXV0gtdEY8E7Ub13pzT8myjfSVWjj+ee
	 eBXSFLllpZvxuMImLMbBpLAqlib1i83JNFa0eLlYT509UAI40r9kEwW0RdKWHk1s0Q5Ln
	 ZuoFg0ySq6liqLX4Zdw3pT+04c90wmxlzwIhgA5X1XbZ8EiZIyrIs+4+eUZRQG3mifVNJ
	 QKOR2qUqptIOBztjmHJX4z5TfWJHMiyQbH+n61dQmNFWCq6aEP3oc9RWBSbGIAbciCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eCDVJEEy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEA3606A335;
	Fri, 27 Nov 2026 14:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eCDVJEEy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319AD1F0089A;
	Fri, 27 Nov 2026 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788310;
	bh=Lb3fYY47wnHUevyvaDmgtyRPvaV2N/l1ui/X6FH+mpc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=eCDVJEEy0qfkoW4WtYAnv8Aat5z/4lVPYtKEVRyj/jJVr9JzlYMEqhCDgfeWooKUz
	 0t7mqvOC6jOdkIkxSOrMBx5hyzYU/pjan869QceTe4y3Z3IW/+AIP05YmxCp4uqSdX
	 bwIuHlzbMgxYn4V23IHo/N68OjCP9ESVlbKHtyrSRDRET19MRnQL91GU/J63ltGd2u
	 krwU9eZ2IagM6BHleqJ5iZ0lTK/zoq+4es0D3myWIPVRqXF7dydgXtuR5tgyokpPGY
	 rhhFgW9/M77uWaMpLuXF09o+/4Llcqcv8fEDgz+i5EeEykYm9KkG7Z4zuSmcU9G3F0
	 aPVbI7VEU2UrA==
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/2] phy: sun4i-usb: clear SIDDQ before the PHY
 reset on A733
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, Xu Rao <raoxu@uniontech.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261116105544.669029-3-vinicius.eduardo.pedrosa@gmail.com>
References: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
 <20261116105544.669029-3-vinicius.eduardo.pedrosa@gmail.com>
Date: Fri, 27 Nov 2026 19:35:01 +0530
Message-Id: <179578830124.13164.6448969213727096361.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1212; i=mani@kernel.org;
 h=from:subject:message-id; bh=8QzInF1J2qP/fK9TJarJMLOvNe7VwTxh+pNNVzDPp7I=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCY4Q8c7TA9KmMf5FaTcXemES5U19AI1NFr3ll
 g1OhyyGwgeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmOEAAKCRBVnxHm/pHO
 9Si9B/48tsiZR3y/6Bvlnzrcq+i+gsShcLe6X1adsXbuj5XxI8KFhAZSfU/HWzcUrhIfQg3h55p
 9taAi1gw9EbB1WudUGXwbtdj784gAhgAzlow5LGpabP2s4OcGXivHnRVZwF2fiuVxzp3CUnuAp2
 ECcpBizzW2i29XwFpreGXAxi6tRv0/mINwfaMR9IxaNClbuJOWtc7trQyVyP5qPt4Ay99M92Jq6
 u7eoYeg6Z/A00ANiq7i8FrpO2hbuIc0zThZfOldsBMphwCHNDyvpCPpo+GNHhKIpAMpKNhXyRGb
 e1ogBrt7QE6411mEuZxUN+5a2xsRRC2/cCmMB4bbmANujZBn
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-16 07:55 -0300, Vinicius Pedrosa wrote:
> sun4i_usb_phy_init() deasserts the PHY reset first and clears SIDDQ in
> the PMU HCI_PHY_CTL register afterwards. The order comes from the H3
> support and the reason for it isn't documented.
> 
> On a Cubie A7Z (A733), the Wi-Fi module on USB1 sometimes came up
> at full speed on the OHCI companion and failed enumeration with -62.
> This happened in 3 of 40 warm boots with a separate local PHY tuning
> change applied.
> 
> With that tuning disabled, the current order failed once in 31 warm
> boots. Clearing SIDDQ before releasing reset had no failures in 60
> warm boots in the same interleaved run, or in 10 cold boots.
> Why the order matters is not understood.
> 
> The vendor BSP clears SIDDQ while the PHY is still in reset, in its
> common host path.
> 
> Add a config flag for the early clear and set it only for the A733,
> whose config is otherwise the D1 one. The other SoCs keep the current
> order: the manuals don't specify one and they weren't tested.
> 
> Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


