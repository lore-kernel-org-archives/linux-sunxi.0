Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82CAF1ACECC
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Dec 2024 17:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733767023; cv=none; b=lgZSJc43gOZfZetmQuFPyQ5YGk7fFxSlMed4MuX9R+KSDxrKR1pKX/q95warfITu/dKdzO0V01Wjxt7E8AtUzDcE8bXXS3FKBH3QsPgFArXH7dxwTga9NqlAeoIWYmv7YpNR6nQjOKa1t8WyPEOkrClT7yiV/npmaEWf3p/pI8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733767023; c=relaxed/simple;
	bh=j3n107nydMG2CyqGPgfya3Iv7yen6+NhL5BGnlDuAe8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KuUXr9iVSnDavu4kjOKvXV/66w2xjKJUGGuOR6yLvyEhO1lvoYSMeURlZcf7+/TD+QOXd2YVeWj5PeTz5lJiawmMOqkg4I2yz3ifTb8H06cBkdY0GWSNtayoFhXdss1DVbQ7rLGVw/sWWSd5LXRDQuq43x4W6fJelFZ6u9mAa8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC4551650;
	Mon,  9 Dec 2024 09:57:27 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB7173F720;
	Mon,  9 Dec 2024 09:56:57 -0800 (PST)
Date: Mon, 9 Dec 2024 17:56:54 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: "=?UTF-8?B?Q3PDs2vDoXMs?= Bence" <csokas.bence@prolan.hu>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Mesih Kilinc
 <mesihkilinc@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>
Subject: Re: [PATCH 2/3] ARM: dts: suniv: f1c100s: Add support for Audio
 Codec
Message-ID: <20241209175654.673cf172@donnerap.manchester.arm.com>
In-Reply-To: <20241205000137.187450-3-csokas.bence@prolan.hu>
References: <20241205000137.187450-1-csokas.bence@prolan.hu>
	<20241205000137.187450-3-csokas.bence@prolan.hu>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Dec 2024 01:01:37 +0100
"Cs=C3=B3k=C3=A1s, Bence" <csokas.bence@prolan.hu> wrote:

> From: Mesih Kilinc <mesihkilinc@gmail.com>
>=20
> Allwinner suniv F1C100s now has basic audio codec support. Enable it
> under device tree.
>=20
> Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
> [ csokas.bence: Rebased on current master ]
> Signed-off-by: Cs=C3=B3k=C3=A1s, Bence <csokas.bence@prolan.hu>

Compared against the F1C200s user manual:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi b/arch/arm/bo=
ot/dts/allwinner/suniv-f1c100s.dtsi
> index 290efe026ceb..e4b41bc93852 100644
> --- a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
> @@ -336,5 +336,19 @@ uart2: serial@1c25800 {
>  			resets =3D <&ccu RST_BUS_UART2>;
>  			status =3D "disabled";
>  		};
> +
> +		codec: codec@1c23c00 {
> +			#sound-dai-cells =3D <0>;
> +			compatible =3D "allwinner,suniv-f1c100s-codec";
> +			reg =3D <0x01c23c00 0x400>;
> +			interrupts =3D <21>;
> +			clocks =3D <&ccu CLK_BUS_CODEC>, <&ccu CLK_CODEC>;
> +			clock-names =3D "apb", "codec";
> +			dmas =3D <&dma SUN4I_DMA_NORMAL 12>,
> +			       <&dma SUN4I_DMA_NORMAL 12>;
> +			dma-names =3D "rx", "tx";
> +			resets =3D <&ccu RST_BUS_CODEC>;
> +			status =3D "disabled";
> +		};
>  	};
>  };

