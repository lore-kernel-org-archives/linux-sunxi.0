Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CDB4D5BD
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 11:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712921522; cv=none; b=Gs1ddG19vBMM7v3cLjRF7OAdGYQHgMXJ9vYFileUiIjVzpi72ibLzOufWp7w6N1WTveQy3L9RQjfEFTAykQaZ6ahl+mE1SXZmFrvZLxSn1bZOHcuKdA1ZjwY0pd3YjcRrbfdZfCdFvz2z4UB0J22i/E1grMMmm31N57QeGMxtNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712921522; c=relaxed/simple;
	bh=BzJrqDFA6AyqBMFADduzWLtGiHXrJzqR3kUA+iQC510=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixRNcZ5ura9pySzzRnoXn/B46dsV8RB7og8mZc4/AzGFDolDCuJXBKaBv72Sh9YoPmksSktv4+RaDjyzOfE/Hn6alGpTg5Zomm9uLHoVqHMD+o7yFjt4dwZyzLESIKLLtx4sje3zkfN9Io6gBraFVtw22rVFi8YP6LvtKw/Nk74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=vJ3VhPU6; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="vJ3VhPU6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1712921520; x=1744457520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BzJrqDFA6AyqBMFADduzWLtGiHXrJzqR3kUA+iQC510=;
  b=vJ3VhPU63326yh4C0PS8kMlHbIdv9NrW0jWDmY1FSMmsBH8MnjY4yCza
   NmcfMyFh7jdD5lTU0b/pPLhF1MLJSEfOglTOVNq9oIMieuh3xyQKMhgSq
   WuHLZf7PiV68XXaOHIFllwtTfKxdPH9iNDD7DTCvIvRIRSVLxj303XOaZ
   lwUdkLRAzapldttFR6RUqDbQSZv4Zm9TxM9yZdyyf2ZC8II0PyCSSRSkB
   oHTDsq/evB1+Rlc++/cu/VfZsMHMo5kEtUbQPe5PCM5Mo2Q8Jp531cafD
   WdP+5fE64RS1+RlY6n7Ey37VT4P8THCI14hVKfzyPYSgjrpBbiT26gjtx
   g==;
X-CSE-ConnectionGUID: VphaOc2hTpGpkTSDHvpbiw==
X-CSE-MsgGUID: V1pgwBcRSfihNzKAqHlD4Q==
X-IronPort-AV: E=Sophos;i="6.07,195,1708412400"; 
   d="asc'?scan'208";a="20733274"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Apr 2024 04:32:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 04:31:27 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 12 Apr 2024 04:31:23 -0700
Date: Fri, 12 Apr 2024 12:30:32 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Evan Green
	<evan@rivosinc.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?=
	<cleger@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<shuah@kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Palmer Dabbelt
	<palmer@rivosinc.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-doc@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 12/19] riscv: Create xtheadvector file
Message-ID: <20240412-thirty-sacrament-db052c7fe6fe@wendy>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-12-4af9815ec746@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zwcSHVZLwjxefjz8"
Content-Disposition: inline
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-12-4af9815ec746@rivosinc.com>

--zwcSHVZLwjxefjz8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 09:11:18PM -0700, Charlie Jenkins wrote:
> These definitions didn't fit anywhere nicely, so create a new file to
> house various xtheadvector instruction encodings.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/xtheadvector.h | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/xtheadvector.h b/arch/riscv/include/a=
sm/xtheadvector.h
> new file mode 100644
> index 000000000000..348263ea164c
> --- /dev/null
> +++ b/arch/riscv/include/asm/xtheadvector.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +/*
> + * Vector 0.7.1 as used for example on T-Head Xuantie cores, uses an old=
er
> + * encoding for vsetvli (ta, ma vs. d1), so provide an instruction for
> + * vsetvli	t4, x0, e8, m8, d1
> + */
> +#define THEAD_VSETVLI_T4X0E8M8D1	".long	0x00307ed7\n\t"
> +#define THEAD_VSETVLI_X0X0E8M8D1	".long	0x00307057\n\t"
> +
> +/*
> + * While in theory, the vector-0.7.1 vsb.v and vlb.v result in the same
> + * encoding as the standard vse8.v and vle8.v, compilers seem to optimize
> + * the call resulting in a different encoding and then using a value for
> + * the "mop" field that is not part of vector-0.7.1
> + * So encode specific variants for vstate_save and _restore.

This wording seems oddly familiar to me, did Heiko not write this?

> + */
> +#define THEAD_VSB_V_V0T0		".long	0x02028027\n\t"
> +#define THEAD_VSB_V_V8T0		".long	0x02028427\n\t"
> +#define THEAD_VSB_V_V16T0		".long	0x02028827\n\t"
> +#define THEAD_VSB_V_V24T0		".long	0x02028c27\n\t"
> +#define THEAD_VLB_V_V0T0		".long	0x012028007\n\t"
> +#define THEAD_VLB_V_V8T0		".long	0x012028407\n\t"
> +#define THEAD_VLB_V_V16T0		".long	0x012028807\n\t"
> +#define THEAD_VLB_V_V24T0		".long	0x012028c07\n\t"
>=20
> --=20
> 2.44.0
>=20

--zwcSHVZLwjxefjz8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhkbWAAKCRB4tDGHoIJi
0nL6AQCJkh59MUri2maEyaJ1kO+VFKtPc14IkIZHwM9bajqXywD+Jf+vDHMGA2cu
5IE2w9WyYjd8dq+NtRxdy9fp8qwtqQE=
=mofk
-----END PGP SIGNATURE-----

--zwcSHVZLwjxefjz8--
