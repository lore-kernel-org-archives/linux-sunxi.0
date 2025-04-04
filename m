Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6C41B808
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Apr 2025 12:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743768291; cv=none; b=YvBWsobd47beAy0xvYiGIexSjUeMYswgj163O/Y856oDblgSlVk3CFONupldpDX6KuDh2BnUy6/rqWWBuZ/VI1WvqcrKLy0BAJrDwAstJxsee/q3U6r495qG1enRGHjgTLtnYQ5VExIKFF3hlLTZBgiNcDuhYXXDQ9ISSWXEAsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743768291; c=relaxed/simple;
	bh=9RyY0I8TiFgdM5iAY/w+YHb5uz0XrHApT93/HZJ374M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/Asn21YsiX1I1anLjXGY90D+VAC8jApqE6HHqe5nILhroOwZDYWmWkR8s2YChLK3d1EkLI2XsXl5cx/5dVspdz6VRgEg30zB2wchxzxFSqbqDz5O1GaoxA6wC88/aJOlfbLj9VzD5sgX3dpd/dSmqzoP3ADKG+wsoAsfCAloko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cxpt3FdN; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cxpt3FdN"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so3760568a12.2
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Apr 2025 05:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743768288; x=1744373088; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ksgi80fBLzSJaAEI7Zj6pS0brYRqc/LQPT3hzVLK7xU=;
        b=Cxpt3FdNl8vDeKaIWF7h2JKZa0r9NjRwPTVNvz7ehfDhHihXx0oc618qW7ZRUuF1Iz
         LiOXtIGxZCCSzBXUqAbBPsG1mSh6hwkxrOR1lhHpGy6rWRctgGKbEq/btXTve/zaX5/N
         FAIqqeM96aBk/shEbFOsH1u+VpNoKaZN/ysqaeWS+bHEaT6qpyqgLqChB22QlUAJmRlv
         S6j8CnjqJVxrwA9BIYo6VMt97acOggBZLV6Hw93Djzyfys4WFwG6nZ1gsfvbmVGhFgbj
         isQEeXFyuPNR42dhKV2cnkQKsVD68DnSD1rbAB9yJHUdHTv2gcGiELxJJYFoIK8oi/Vj
         hR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743768288; x=1744373088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ksgi80fBLzSJaAEI7Zj6pS0brYRqc/LQPT3hzVLK7xU=;
        b=olFxXYsBDTnXS30LbaBhLtYecTX9CWuoh660c1s6i31c8TEElv6OFyLDn972GBxIh5
         Wd7s7H3XBrb1QeW2bkQNENgJ+paFwcioXxYIAx+8NpXSm7Rk6inAeK7OFdbmFxDMT+qD
         NVcIZk5Fc8c3BTPpLkUmSfyz+VQZrhdbg/mEJWlVziupcUgDYobUHtQeMbdzNwEGw8T9
         FMcJatzMrUR8iFxCA2rsXVTsFqLVdGhEqNbQRU+n1W231YLZtUA23rmcQqtwH+HA+Btg
         U+hF4YYI5AZG/XisqZnDw95KXBNC3Tb1CAR90qVVDqjJTa9VdIl4XSR53I1C/J5GzWcz
         BYVg==
X-Forwarded-Encrypted: i=1; AJvYcCV/6u1R1ihrx5YJMGbii1LSni1pI7KR+qqJR9uT8HC3RPppOl6hQBauJ95LOgMCcJoZnq0KEV+F4BPWBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxNKfO2q/8DyjqrmWTg/WqFOocvH/ZIuSkxyqaykLAhoMhTYF+
	HeMF40p+UQSScjX1C4RCAuy8C8HTDklZcz4yshfPcbw3vVA+SDcL3Esy2+zazes=
X-Gm-Gg: ASbGnctG/A0mYoiefHwm+9z7/t3CmB0HgVhC63+cumjATbPw6fZnRofZiuVRdPc++IW
	3fb6SZyM/VFJ9E8/Miiux98dVMvUcsD1R8qn2+SaZtw6RTz6U7EVTIpHuFZZ3JTgyPcN64Vyfc+
	RahFVIK5wx644J8HpyVuAL64LV34j/9zuH7qak4rtgi+VR+7XDgjghaohUseJi3WPxnG1fwtcvM
	qMY+fZOeI1mHOKbFu1uuEWPTEXlONVNM0Cb7HuNkFmi1eYxuRoDStzwZ4lMWDZedWo7ISQQvU1P
	odeOVoi/LMbpCD3dWKPz6R74sJmguR0mX3XMi1X3xvTZRwZlh435XvSG
X-Google-Smtp-Source: AGHT+IH5Ij+fmf2Cv6jAlPmeJCCy1hd8btt4BuhHv/bD/os6ByinB+7Aq8sAGgjUE/8mRPndj8Zo0g==
X-Received: by 2002:a05:6402:2708:b0:5f0:9eb3:8e71 with SMTP id 4fb4d7f45d1cf-5f0b3e34eafmr2516192a12.27.1743768287658;
        Fri, 04 Apr 2025 05:04:47 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:e124:1321:48a4:8c63])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a458csm2276353a12.69.2025.04.04.05.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 05:04:47 -0700 (PDT)
Date: Fri, 4 Apr 2025 14:04:41 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
	Conor Dooley <conor@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mips@vger.kernel.org, imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 06/19] arm64: dts: qcom: msm8939: Fix CPU node
 "enable-method" property dependencies
Message-ID: <Z-_K2XDEcbtcCMVM@linaro.org>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-6-076be7171a85@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-dt-cpu-schema-v1-6-076be7171a85@kernel.org>

On Thu, Apr 03, 2025 at 09:59:27PM -0500, Rob Herring (Arm) wrote:
> The "qcom,acc" and "qcom,saw" properties aren't valid with "spin-table"
> enable-method nor are they used on 64-bit kernels, so they can be
> dropped.
> 

The bootloader we currently use on these devices reads these properties
to set up the spin-table, so removing these will break booting secondary
CPU cores.

The motivation for implementing it that way was that 32-bit vs 64-bit
kernel shouldn't be relevant for the describing the hardware blocks in
the device tree. The code in the bootloader is generic and handles
different SoCs (e.g. msm8916 with 4 cores and msm8939 with 8 cores, the
enable sequences are identical).

Can we keep this in somehow? To be fair, I'm not sure what property we
could match on to check if these properties are allowed ...

Thanks,
Stephan

> The "spin-table" enable-method requires "cpu-release-addr" property,
> so add a dummy entry. It is assumed the bootloader will fill in the
> correct values.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8939.dtsi | 24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> index 7cd5660de1b3..36f2ba3fb81c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> @@ -46,10 +46,9 @@ cpu0: cpu@100 {
>  			compatible = "arm,cortex-a53";
>  			device_type = "cpu";
>  			enable-method = "spin-table";
> +			cpu-release-addr = /bits/ 64 <0>;
>  			reg = <0x100>;
>  			next-level-cache = <&l2_1>;
> -			qcom,acc = <&acc0>;
> -			qcom,saw = <&saw0>;
>  			cpu-idle-states = <&cpu_sleep_0>;
>  			clocks = <&apcs1_mbox>;
>  			#cooling-cells = <2>;
> @@ -64,10 +63,9 @@ cpu1: cpu@101 {
>  			compatible = "arm,cortex-a53";
>  			device_type = "cpu";
>  			enable-method = "spin-table";
> +			cpu-release-addr = /bits/ 64 <0>;
>  			reg = <0x101>;
>  			next-level-cache = <&l2_1>;
> -			qcom,acc = <&acc1>;
> -			qcom,saw = <&saw1>;
>  			cpu-idle-states = <&cpu_sleep_0>;
>  			clocks = <&apcs1_mbox>;
>  			#cooling-cells = <2>;
> @@ -77,10 +75,9 @@ cpu2: cpu@102 {
>  			compatible = "arm,cortex-a53";
>  			device_type = "cpu";
>  			enable-method = "spin-table";
> +			cpu-release-addr = /bits/ 64 <0>;
>  			reg = <0x102>;
>  			next-level-cache = <&l2_1>;
> -			qcom,acc = <&acc2>;
> -			qcom,saw = <&saw2>;
>  			cpu-idle-states = <&cpu_sleep_0>;
>  			clocks = <&apcs1_mbox>;
>  			#cooling-cells = <2>;
> @@ -90,10 +87,9 @@ cpu3: cpu@103 {
>  			compatible = "arm,cortex-a53";
>  			device_type = "cpu";
>  			enable-method = "spin-table";
> +			cpu-release-addr = /bits/ 64 <0>;
>  			reg = <0x103>;
>  			next-level-cache = <&l2_1>;
> -			qcom,acc = <&acc3>;
> -			qcom,saw = <&saw3>;
>  			cpu-idle-states = <&cpu_sleep_0>;
>  			clocks = <&apcs1_mbox>;
>  			#cooling-cells = <2>;
> @@ -103,9 +99,8 @@ cpu4: cpu@0 {
>  			compatible = "arm,cortex-a53";
>  			device_type = "cpu";
>  			enable-method = "spin-table";
> +			cpu-release-addr = /bits/ 64 <0>;
>  			reg = <0x0>;
> -			qcom,acc = <&acc4>;
> -			qcom,saw = <&saw4>;
>  			cpu-idle-states = <&cpu_sleep_0>;
>  			clocks = <&apcs0_mbox>;
>  			#cooling-cells = <2>;
> @@ -121,10 +116,9 @@ cpu5: cpu@1 {
>  			compatible = "arm,cortex-a53";
>  			device_type = "cpu";
>  			enable-method = "spin-table";
> +			cpu-release-addr = /bits/ 64 <0>;
>  			reg = <0x1>;
>  			next-level-cache = <&l2_0>;
> -			qcom,acc = <&acc5>;
> -			qcom,saw = <&saw5>;
>  			cpu-idle-states = <&cpu_sleep_0>;
>  			clocks = <&apcs0_mbox>;
>  			#cooling-cells = <2>;
> @@ -134,10 +128,9 @@ cpu6: cpu@2 {
>  			compatible = "arm,cortex-a53";
>  			device_type = "cpu";
>  			enable-method = "spin-table";
> +			cpu-release-addr = /bits/ 64 <0>;
>  			reg = <0x2>;
>  			next-level-cache = <&l2_0>;
> -			qcom,acc = <&acc6>;
> -			qcom,saw = <&saw6>;
>  			cpu-idle-states = <&cpu_sleep_0>;
>  			clocks = <&apcs0_mbox>;
>  			#cooling-cells = <2>;
> @@ -147,10 +140,9 @@ cpu7: cpu@3 {
>  			compatible = "arm,cortex-a53";
>  			device_type = "cpu";
>  			enable-method = "spin-table";
> +			cpu-release-addr = /bits/ 64 <0>;
>  			reg = <0x3>;
>  			next-level-cache = <&l2_0>;
> -			qcom,acc = <&acc7>;
> -			qcom,saw = <&saw7>;
>  			cpu-idle-states = <&cpu_sleep_0>;
>  			clocks = <&apcs0_mbox>;
>  			#cooling-cells = <2>;
> 
> -- 
> 2.47.2
> 
