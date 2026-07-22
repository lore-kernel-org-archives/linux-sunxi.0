Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7031C356772
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 22:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757805; cv=none; b=Fp/HrDu/azc4pHWrDKNODLIuku8bSg+j+6GLBnPxPPtMCbxFxvAGrSDH/lDokBnqR5isMlOorlUG0TOrGD+/L+B3xFbvh4H8uo0cWhh1q8olbT05lBp/yDSla4MjuKqULzK6c/yAw1RBRNcxYP6OEXnotYuMKjAPmoGtvpqvBYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757805; c=relaxed/simple;
	bh=TvkH+0aIc0tTfnfI29eAMPyUgUnwWVPMiXTscEFc5cA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pC6aKKLVyixy/X/Byb+fu2JKydle1BxJTYpsLeZ5ZdU75/WWg+JZV8VrU0iuZKDtgrdZm11V15AsUgZxAuJVtDyIiDcP6mJc6d4xWydqRFzYALOPLAK/iefSxG2kIhpFw6iG2DENksLYQoesOIwPKrRDU5H1fuD8tu3qW3+nqoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XTm0JRa0; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XTm0JRa0"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F13071595;
	Wed, 22 Jul 2026 15:03:15 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FCEB3F59E;
	Wed, 22 Jul 2026 15:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784757800; bh=TvkH+0aIc0tTfnfI29eAMPyUgUnwWVPMiXTscEFc5cA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XTm0JRa070xzyTfMFsuNcX9jqqculPqlDQMejuKiQb4wP6pN/nZdOfTCx6Ws+uT6t
	 syAD0yNAB2azqVHCLaPdPuJdt5iTrpJ2cpGoJJx7XU4ELMmtW6eLPsb+9uLR0/SaF7
	 xY9F/mth18z3GtXMLVA5pbojc4fOTc6Aynn0pCb8=
Date: Wed, 22 Jul 2026 23:59:25 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Justin Suess <utilityemal77@gmail.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Sashiko
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: a523: enable IR receiver
 on the X96Q Pro+
Message-ID: <20260722235925.42c3466b@ryzen.lan>
In-Reply-To: <20260722201717.2205609-4-utilityemal77@gmail.com>
References: <20260722201717.2205609-1-utilityemal77@gmail.com>
	<20260722201717.2205609-4-utilityemal77@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Jul 2026 16:17:17 -0400
Justin Suess <utilityemal77@gmail.com> wrote:

Hi,

> The X96Q Pro+ TV box has an IR receiver window on the front panel,
> wired to the SoC CIR input on PL11.
> 
> Enable the CIR receiver in the RTC power domain and mux its RX
> signal to PL11.
> 
> Tested on an X96 Pro+ with ir-keytable and nec keybindings with
> the remote that it came with in the box.
> 
> Signed-off-by: Justin Suess <utilityemal77@gmail.com>

Confirmed with evtest and some random TV remote.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> index a96927fbdadd..1eaee20acaab 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> @@ -266,6 +266,12 @@ reg_dcdc3_323: dcdc3 {
>  	};
>  };
>  
> +&r_ir {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&r_ir_rx_pin>;
> +	status = "okay";
> +};
> +
>  &r_pio {
>  /*
>   * Specifying the supply would create a circular dependency.

