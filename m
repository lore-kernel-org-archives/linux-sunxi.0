Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF0011CA0;
	Fri,  3 Jan 2025 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735917633; cv=none; b=DSE4cSNHvC2ev7umcwrVqULH6XShlSQjxSgQPNg68TB4F42sfd3ECSwub81mXBOrOmgR+yABkVu2lKcRqVYOsd27D06hMTUs1ZQPjFlL9reoUuMhLGZh4mxcNkHghR12CKnY0UfksawUR7MP4iOO+PvSXEtoXxru7mG9CkbAFYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735917633; c=relaxed/simple;
	bh=QJINj3uN3/eTOmdWL3Jhcy4fbhqx0x7mEEplwLDUQRs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GEmOY8JyjTgINQoXE+gkocY+y2mn/YNB8b6QdZgtG8dei6ykDmvwKlUSJrWeKNBMV/HG2ee4WNQnqEaYOzDZRv9fxGI5t9m4ECtlidAsF8WB9CrkDohd+aif5pqQS8FZkYfIkSTvqW780oxEFPN9A4wELHm3Bo9cRRTDg/WftwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DxlFbgSh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DxlFbgSh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B2CC4CECE;
	Fri,  3 Jan 2025 15:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735917631;
	bh=QJINj3uN3/eTOmdWL3Jhcy4fbhqx0x7mEEplwLDUQRs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DxlFbgShUl4VcEtWCFIolbrtYDaZkbka7Uuu41+w2t5k8cyFu6FzOBN+KMYnje50/
	 wn6EkE8lD2nUxSkDdAUCZU/ljyRDclasGVMrCqMr0RKWOZGaf9G9rHPhbBIUDHCz+L
	 urCH8sroLQF7N18DzW4UoCuyRww/8RRFzojXmHn0+cd4heRVvX1TGjiiKSW299TnrO
	 vFN/XwvW7aq/hx281MnxGZpAwriyTSOEHnk4HIbpkZJ+cl9T0YmKaBpZqcnbpXvmX0
	 RUhcaTLyHShysn6OBEcqMB/MyrAKpX+Js0i5i33a4vhunBsrhtbtT4sWUHUc3VHqGB
	 e3K1CB68IgmVA==
Date: Fri, 03 Jan 2025 09:20:29 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
In-Reply-To: <20250102150508.3581-1-lukas.schmid@netcube.li>
References: <20250102150508.3581-1-lukas.schmid@netcube.li>
Message-Id: <173591745697.2305265.17487385995864491959.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add NetCube Systems
 Austria name


On Thu, 02 Jan 2025 15:05:04 +0000, Lukas Schmid wrote:
> NetCube Systems Austria is a company that produces embedded systems
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y allwinner/sun8i-v3s-netcube-kumquat.dtb' for 20250102150508.3581-1-lukas.schmid@netcube.li:

arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dtb: pinctrl@1c20800: 'gpio-reserved-ranges' does not match any of the regexes: '^([rs]-)?(([a-z0-9]{3,}|[a-oq-z][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$', '^vcc-p[a-ilm]-supply$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun4i-a10-pinctrl.yaml#





