Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18E827B4E6;
	Tue,  6 May 2025 12:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533244; cv=none; b=fKmtIwMlk6pfKcMPGVsFdJDSxCUQe99PuvvFU4a+nzplkWzr8qaelIHKdFXgU4FI8wx7KAjosSTStHBu9aupA1Jwz1DvGbH7wK5Gk7bGsJSWlymeTZ23zl1k6F8CqRvsbIyWDqZY17urHqvjVwnYzJjVudbNTQfnuN+LOG3dzPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533244; c=relaxed/simple;
	bh=kF4ClozlXaTiubCjpTTMEwshEsW50rfjVmdWRfDGDeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vw9JPbBBn7V/M/jd+nmGyQFn+u4ndd8x0F781VyCNNnBgAx8K7iQ1WQt+WxNas8KD+7ozl6wFoSEyYUip6KpoVBCErlnvUYE3jiy2g2V/DD2HzkAw1CudwzRIBKbIFQ5dBoX8F9GqcXjRIZhnmfgGkC63em1D4YGQAUlqYigLN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxf3s2km; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxf3s2km"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD1FC4CEE4;
	Tue,  6 May 2025 12:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746533244;
	bh=kF4ClozlXaTiubCjpTTMEwshEsW50rfjVmdWRfDGDeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nxf3s2km64f58FDljyrwyNDQ43gCDGgojAM4e272PJErdAA6l5da5MWROl1XuzgCQ
	 OPmYeikt5idn+iLBNg5+6ApyCfdxK5CQDfYM4Ld3WSTeo8HMCrs+g5VhehFEtitnax
	 4tQkIQ9XiMTGGa+JcQwNYeMwdirMwudx9YBMuj8OeiF0XkAxNs++bJxnGM0OLkCcRq
	 xiMYPpLA97hzrjMmcFBgeYxREFIXhgq0DzJHp8tKlMuFxOmOCXX34/+ewQF4kKzYzm
	 eNgVqB6wV997omjY+WgeOMVUG0FwxWHeHtVbtJEHuu2qr082DNj7liOgS0kUiiY9Ei
	 mawoeyzn+im3Q==
Date: Tue, 6 May 2025 07:07:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Philippe Simons <simons.philippe@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add Liontron H-A133L board
 name
Message-ID: <174653324210.611292.5461572856849949158.robh@kernel.org>
References: <20250505164729.18175-1-andre.przywara@arm.com>
 <20250505164729.18175-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505164729.18175-3-andre.przywara@arm.com>


On Mon, 05 May 2025 17:47:28 +0100, Andre Przywara wrote:
> The Liontron H-A133L is an industrial development board using the
> Allwinner A133 SoC.
> 
> Add its compatible name to the list of valid board names.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

