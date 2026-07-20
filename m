Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251123C1F2B
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jul 2026 20:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579296; cv=none; b=FujW8TkzyaB7Xv1lB9p0XooXuhjlkpRKADH4qzqh2Lcsr9Pdl1O6vMjUS8rINg5W8GQjrNipH0ZppKrt7x9u9hPlzTTSCxmItQkwE6wS0rl+HsFKKXXfvHuxojXCEkOMcj2RlNO+dLco38/kwy/NeOvikubrC/291b70cFr3iaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579296; c=relaxed/simple;
	bh=nQJLmuZAjlXCvBDXMohcZ1j/B2+X5Z8O3RPYfkvXlB8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R+uHP86dDPEO67TYaK4sQXvJHnMT/Bn6t5W5kHY19FLNmYodWkZEF+0aLLOWs1VrMyxNdBiXQXaEhaaLpCcvXzAtnuZ98+vIdoH19HZLZNqyeAJwP1FwCeasx9dV6J/ED39qpPhJfyelEKCdolLeW4sTy7006uJnsnwdj+CrAg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FaCaGQdd; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FaCaGQdd"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 506A1143D;
	Mon, 20 Jul 2026 13:28:04 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 573FB3F86F;
	Mon, 20 Jul 2026 13:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784579288; bh=nQJLmuZAjlXCvBDXMohcZ1j/B2+X5Z8O3RPYfkvXlB8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FaCaGQddWXnChyga+RlhKYyLo8XEy4ewC/EDTFcDq5vXLzxixfQMBSTMF8zwQnRqL
	 +1NBWJuZasrxbqVyEL3NC+PBLd2yrjmYBZBFYAhwijAtPkMtZWv9c1/fKrvX043IFr
	 L+nKIgPQSzVdpSSODZxxWWXKRhcbX97KiFMtz4XM=
Date: Mon, 20 Jul 2026 22:24:20 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Per Larsson <per@palvencia.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS), linux-arm-kernel@lists.infradead.org (moderated
 list:ARM/Allwinner sunXi SoC support), linux-sunxi@lists.linux.dev (open
 list:ARM/Allwinner sunXi SoC support), linux-kernel@vger.kernel.org (open
 list)
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: a523: Add missing SPDIF pin
Message-ID: <20260720222420.0c063b18@ryzen.lan>
In-Reply-To: <20260720174253.7686-1-per@palvencia.se>
References: <20260720174253.7686-1-per@palvencia.se>
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

On Mon, 20 Jul 2026 19:42:42 +0200
Per Larsson <per@palvencia.se> wrote:

Hi,

thanks for takign the time to send a patch!

> When spdif support was added for the Allwinner A523 family of SoCs, only
> two of the three possible pins were added to the dtsi, since the third
> would clash with the first ethernet port (emac0)
> However, some devices don't use emac0 and instead use emac1 for the only
> available ethernet port, leaving the pin free to use for spdif.

Not sure we need such an elaborate excuse to add a pinmux that is
used on one device - you could just say *that* instead.
But that's not a big issue, as the patch itself is correct.


> Add the missing pin to the dtsi so such devices can (later) use it
> 
> Signed-off-by: Per Larsson <per@palvencia.se>

Checked the details against the user manual: they match:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index ca6a16807049..7370e8ed24ec 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -216,6 +216,13 @@ spdif_out_pb_pin: spdif-pb-pin {
>  				allwinner,pinmux = <2>;
>  			};
>  
> +			/omit-if-no-ref/
> +			spdif_out_ph_pin: spdif-ph-pin {
> +				pins = "PH7";
> +				function = "spdif";
> +				allwinner,pinmux = <4>;
> +			};
> +
>  			/omit-if-no-ref/
>  			spdif_out_pi_pin: spdif-pi-pin {
>  				pins = "PI10";

