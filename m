Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71E3264F9F
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Sep 2025 08:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757667261; cv=none; b=qxdbD4/m+c82zZSpDyG9fLM7x+VLYa304F03Jf7jULIDlVJKYgb/ba+nHnQswhAzLsDF947XfE/tZYsa5c1mLaT2Pcw8Xn720IGc64jXADy1QheOFUC500A6B0uGwaoeLoY/wzK7CXYz+G1nX+thjA4au5bT4igyp2pKjlsqGiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757667261; c=relaxed/simple;
	bh=yUhtLjkGj/wMebLJvOtshEiTqkJ/AlqFRp4g9VlVFy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQa0NPSkz8K2fn1KTIOUlymKlt06+JXL1QLZlvgui4CWRxJMolc+9Gqg2ftngt7mB0HzvyBI4HCTgtRW2ylpHkxUERno/J58de2r35CAXHskdJItskFn/r8vq1IFcEyOcHUzGz68tDr3vma8P5Lqfp4FCarqpseK02Suhrov4Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=mDwsbaUW; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="mDwsbaUW"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 8B173240027
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Sep 2025 10:54:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1757667256; bh=W67eMTfc1EUhyH5LMz7dYtNTmFg2IWl15wR2G9kYiv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=mDwsbaUWHe/RDDjADVRMP4OXGJDNTox56VF6PFcoLhN5OOhahJ59N33xPa5kWNMDQ
	 3sMBLUwqRzAwkcyq/CS3QMksvetZRCVnmkC5ziQ8eFc7atx5oEAVx7fcwQEG23NnTi
	 hk/ziwG3AG/VU6P1wsZATv43kFJhH9XLW8W50khbs9btXAPF+IxQC5QYBuSoLETW+O
	 LF+zLCxXDBykFCEaSBfDWtnIPbNAAsqaQK54HKw+wIsH7EZOuwsQL+EtkN2xtfqx5Z
	 9mSNo0vO4itnsttAp59mIlxvrBqaEnmfO4S6X7q8g07dhEQNCI1651W0svN/4A6cPT
	 qBhO14tTfPuDA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4cNSsL4ymLz6v12;
	Fri, 12 Sep 2025 10:54:14 +0200 (CEST)
Date: Fri, 12 Sep 2025 08:54:15 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h313: Add Amediatech X96Q
Message-ID: <aMPftsaf4x61-bGY@probook>
References: <20250912-x96q-v1-0-8471daaf39db@posteo.net>
 <20250912-x96q-v1-2-8471daaf39db@posteo.net>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912-x96q-v1-2-8471daaf39db@posteo.net>

On Fri, Sep 12, 2025 at 01:52:10AM +0200, J. Neuschäfer via B4 Relay wrote:
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> The X96Q is a set-top box with an H313 SoC, AXP305 PMIC, 1 or 2 GiB RAM,
> 8 or 16 GiB eMMC flash, 2x USB A, Micro-SD, HDMI, Ethernet, audio/video
> output, and infrared input.
> 
>   https://x96mini.com/products/x96q-tv-box-android-10-set-top-box
[...]
> +&gpu {
> +	mali-supply = <&reg_dcdcc>;
> +	status = "okay";
> +};

Note for v2: The GPU gets stuck in probe deferral, and I forgot to
investigate why.
