Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C0827C157;
	Tue,  6 May 2025 12:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533206; cv=none; b=JGoXE8XOVAkDWlKWoNUK45k8bkeLheuiFrmdglEcjHAhe3ZUbKhu4DEdIoMTqDYANxkp/TvOBAd/iUy0z8/gW5vIU7se8DYhRu9zq4WpEZOpzE54AZ/LL+QgOezBMOiIZKMSTGqslrg8ovHoGlZyHKK9LRxbLh4a+l7UV+wCxz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533206; c=relaxed/simple;
	bh=kKU+uCIszAf0TanYBW6FtHHTFA9JElr5vNNK/+12RjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZQ66iVx/fAPHCzy5OsChmDRExb4ZZ1hbqngtPHubcj7isHomRZbKUCq1f+V8XkALMDHUlSUj/mpmCfcGVseU4MMgDD6uLhiaQoTo61o6htAwbdYDiL4ghc7o+NHBCgn4Cv3lOxIABzXkydFhNgj7j19oN+TWt4gAxLTGp4Pbfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eN50fn5Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eN50fn5Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE53EC4CEED;
	Tue,  6 May 2025 12:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746533206;
	bh=kKU+uCIszAf0TanYBW6FtHHTFA9JElr5vNNK/+12RjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eN50fn5ZeJQl72u4TLKSNAfG/8dzMfS7MFq6JTHLB4suCW7dN+2XDelJd80g8X1uM
	 69U/18mlGG3t2v7soTPcHSp58UhvW3UR7GoyuhXF6VDCR7Rqirynz7PVl0F2QS20B6
	 W/skUjXH5DgJZIkHHz4HuV6AgGYMpqluonLz5B3Ub/D9QQmepho5lmW27iFSDAHqKe
	 I/oGxHgyKeJJirQpS+3IOqwk3Z6h9nJAeefA7RyPTzJMOXXWHp8xYa4LjVCDCxWAE0
	 ohj/qh9eVZh0QNM796NjT2ccD4Dmf0af8Z+poTvk/UWTgACbBwyiVTWTqVljGPMWrT
	 aMOcuJj3JzAJQ==
Date: Tue, 6 May 2025 07:06:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	Chen-Yu Tsai <wens@csie.org>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Liontron name
Message-ID: <174653320333.607552.11987630283053407011.robh@kernel.org>
References: <20250505164729.18175-1-andre.przywara@arm.com>
 <20250505164729.18175-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505164729.18175-2-andre.przywara@arm.com>


On Mon, 05 May 2025 17:47:27 +0100, Andre Przywara wrote:
> Liontron is a company based in Shenzen, China, making industrial
> development boards and embedded computers, mostly using Rockchip and
> Allwinner SoCs.
> 
> Add their name to the list of vendors.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

