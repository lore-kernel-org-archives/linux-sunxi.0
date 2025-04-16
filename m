Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB2823536A
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Apr 2025 10:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744798287; cv=none; b=Zvzvv6kIMy9kIO0EC0LvCn6SFF/ljG213PeVjlhwvb5eLZmWnTmKwvyGefhY4yatNkPGWSqG8QBER2CEv9HjPqw807tH9iVRREip11hhN4EmN07cVsExcqlzksPInzWGsgvc/opBwr7Ag9xsqH4tKIv0I6GUppeLwbLc7B92F/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744798287; c=relaxed/simple;
	bh=bPoeZDmonHWLDSTPwGCwozvXf49O//btsCfxc1EAQs4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qcZ3+k7ZHfulZvOjBGlL8oprq83u0+ql+nu76an41uQOjfh2abuRRaiKsPx4s0bs/VPeNILhVlqnyj0Hjk8sxAohA4pzC98KPG6UIFyhlGM970MG+dlMY5ZhwTvaVw09nex4wLixki/+TyndQWK62UUw/vf7HIOwUlpwoTCJcnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DA5D152B;
	Wed, 16 Apr 2025 03:11:23 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 867EE3F694;
	Wed, 16 Apr 2025 03:11:23 -0700 (PDT)
Date: Wed, 16 Apr 2025 11:11:18 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: allwinner: correct the model name for
 Radxa Cubie A5E
Message-ID: <20250416111118.2afd8f89@donnerap.manchester.arm.com>
In-Reply-To: <20250416100006.82920-1-amadeus@jmu.edu.cn>
References: <20250416100006.82920-1-amadeus@jmu.edu.cn>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Apr 2025 18:00:06 +0800
Chukun Pan <amadeus@jmu.edu.cn> wrote:

> According to https://radxa.com/products/cubie/a5e,
> the name of this board should be "Radxa Cubie A5E".
> This is also consistent with the dt-bindings.
> 
> Fixes: 80e0fb4e491b ("arm64: dts: allwinner: a523: add Radxa A5E support")
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Indeed, thanks for sending a patch!

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> index 912e1bda974c..03c9a9ef5adc 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> @@ -8,7 +8,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  
>  / {
> -	model = "Radxa A5E";
> +	model = "Radxa Cubie A5E";
>  	compatible = "radxa,cubie-a5e", "allwinner,sun55i-a527";
>  
>  	aliases {

