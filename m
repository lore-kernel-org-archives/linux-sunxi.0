Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85FE83CDB
	for <linux-sunxi@lists.linux.dev>; Thu, 31 Oct 2024 14:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730384112; cv=none; b=pUY4qolHzFZr7DMevZomtF2HpqSiRteZAlaKfmB91Ay4CrHx8N54jXYUVCFUq0ZmFnFY3OjX6qUQBFV5OlArfwW/yvMlhqpvCRIseMpcb60jQgmt5SXwRPup1b8cz0/v7hopCrG/Rmak/IY/qot2T9TFnsaTX8WJ7D7QGqVOuj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730384112; c=relaxed/simple;
	bh=Kdog3okChVG+qtVt1DYFpPo7Ncm0Hjlct7/16T1KnLs=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BO+4csgB3p4PPFapWJXjOvJLb0/irAP8AMurflEI358/OR6YyNHP/bjp2u/9sQxhNnEY6BEK5JJ+xBnk4V1WPKAShqSKDgFRfp06p42DiEUqk6GxbgAaXQ++1qMenmGUOhI/n//rB7gzuML/y2q8PNqyn62IbPRIP+5yn9vp6zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=ZFzwELqO; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="ZFzwELqO"
Received: from eig-obgw-6001a.ext.cloudfilter.net ([10.0.30.140])
	by cmsmtp with ESMTPS
	id 6B7ctABW8nNFG6Vx2t1jay; Thu, 31 Oct 2024 14:15:04 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id 6VwztytTL2Zy06Vx1tZFZ8; Thu, 31 Oct 2024 14:15:03 +0000
X-Authority-Analysis: v=2.4 cv=Q4EZ4J2a c=1 sm=1 tr=0 ts=672390e7
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=-pn6D5nKLtMA:10 a=6Ujbnq6iAAAA:8
 a=7CQSdrXTAAAA:8 a=vU9dKmh3AAAA:8 a=oUTu_NvtNUWWlwhRUWsA:9 a=QEXdDO2ut3YA:10
 a=-sNzveBoo8RYOSiOai2t:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GY6AwgdHxbopxTlrLA2vjYBTcxsL4277viuzwS9TPwk=; b=ZFzwELqOkrSNBIMVRTiDlSFHyU
	uj5CcjhYb80VHZUVw7ln/7cP9qYhRKcYxMzRae/5d6Dmz47qP5nCVXEsYdZtSAdFgyVtwYmIRLd/z
	Po/4rajeYeTvsjdgq1evjHmH3bwOiXAFu3GsqHKS6zwO3Uy90qgzB1rIR5hrv5W2GsrVH8o+8OAOJ
	3baIK8SJmQAa7Fhi8mhpu2aWlNDzQm7YwS2/D8QNke3Op0VtQzkDqKyayfIflaAeVHfILbQXcXX2/
	bT5K+wuHNoK3tKUqeK4yEWjN1XVqYT+WBlqD8Cy+AcG3kBgXa02V19AM5iFV8coPfp6h5j+viKvc1
	cA8+nkxw==;
Received: from [122.165.245.213] (port=51552 helo=[192.168.1.5])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1t6Vwq-0038ez-1T;
	Thu, 31 Oct 2024 19:44:52 +0530
Message-ID: <fd26dadb-1a55-49dd-9530-5a3e2a58e36a@linumiz.com>
Date: Thu, 31 Oct 2024 19:44:48 +0530
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/13] arm64: dts: allwinner: a100: add watchdog node
To: Cody Eksal <masterr3c0rd@epochal.quest>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-3-masterr3c0rd@epochal.quest>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20241031070232.1793078-3-masterr3c0rd@epochal.quest>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1t6Vwq-0038ez-1T
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:51552
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 2
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfB3OUZQoolzsxcZhkJSlpKg8NT0apwX/OUM0IWeilD75NmoNpB9J0C5Bi5/hJz4WrCNy0zf2o77xrL8GU+4Q5diJR5FMeAFLvwwegXTM/Eg431Yxpf8u
 ty4zSIQ0fXni3gqxEIBMOltkO/TpZObi8qduHwLEfZD6Y06AWG4F4+4rT11AjzyntDe3H59836UEgCAPk3MvU4Zlfk00AjWGNxo=

On 10/31/24 12:32 PM, Cody Eksal wrote:
> From: Yangtao Li <frank@allwinnertech.com>
> 
> Declare A100's watchdog in the device-tree.
> 
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
Tested-by: Parthiban Nallathambi <parthiban@linumiz.com>

Thanks,
Parthiban
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> index 1eca7c220ede..adb11b26045f 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -144,6 +144,14 @@ ths_calibration: calib@14 {
>  			};
>  		};
>  
> +		watchdog@30090a0 {
> +			compatible = "allwinner,sun50i-a100-wdt",
> +				     "allwinner,sun6i-a31-wdt";
> +			reg = <0x030090a0 0x20>;
> +			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&dcxo24M>;
> +		};
> +
>  		pio: pinctrl@300b000 {
>  			compatible = "allwinner,sun50i-a100-pinctrl";
>  			reg = <0x0300b000 0x400>;

