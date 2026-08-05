Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412B838237A;
	Wed,  5 Aug 2026 14:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785939784; cv=none; b=i9mc4bOglSHgIYTWqb7Qkmoc40QC0/eK9frhfKu1PTewKGPGDZcpjYWQaYF4WUkkAr5mp6FIRNmbrAVcospG5jfXFDQl8ChmS6Pkdljhzfa0Yfcgq55YDZaW8v12vsSfw7a6EgIaC1GM25+BRBf4PMpApi6O1TU/F/wjgH6Jhcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785939784; c=relaxed/simple;
	bh=kET92rdROOrNoeoMWHdr75LJECr0hlQMqvvvuPZLpu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lF/+TAaSp27CLI1EOiyCR8V8dO0jHoh9TS+QPv0TdiHHyuGC3Aho7L6TTQ4GI7P1JgQpm0eYmgXXBSyOX8Be8sBLhVzxDRMbTSNgbokT0+geRlp0wfRJOILERDTgI9aXGiEsYKjHvYJp4xVHFeZCSeHQmv+WejjCUJzRlP/INPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlbWjj7+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlbWjj7+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE4F1F00A3A;
	Wed,  5 Aug 2026 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785939774;
	bh=vtFogd9Yw/S+y2ZZkzMQdnH2xhJ3MBW6Yho0E6kCH+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IlbWjj7+sINUO1Vw7fwnR0Cx5BAwf8PlFf5lX9PNVakRSfI32KlCDwEexX5uuoXVT
	 MnrBciX8ueqmC7Mw4+SlQ73lWMr6xgzOkOukG7jeTmeSaovYh5m1w7FJyZcNiIdjC4
	 eTV3UgeB1TUWlWmPnoH4GWLDPgAy2//IDMCU8vXSMj55Ubmnh9qOuTfw5zVoWwV/Ip
	 ln5k5fMEjGiVZ+XKTt5xh2+rd5yQBz/ZzOE9Ns2z5DXGRvs4kLrZX3wW/QXUS9ywK2
	 KdwN3zbnQsNb0kIOEx9UkCxxWol4+0cozvECvFUzHd+wEQd6B3OvsJx3LnRXxLElZf
	 EB1HxzkWn5vAw==
Date: Wed, 5 Aug 2026 09:22:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: irq: sun7i-nmi: Document the Allwinner A733
 NMI controller
Message-ID: <178593977246.792405.15302040660276543988.robh@kernel.org>
References: <20260731-allwinner-a733-nmi-support-v1-1-61e4a0825b20@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731-allwinner-a733-nmi-support-v1-1-61e4a0825b20@baylibre.com>


On Fri, 31 Jul 2026 18:09:52 +0200, Jerome Brunet wrote:
> The A733 NMI controller is compatible with the A523 one. Add an
> A733-specific compatible string, with the A523 as fallback.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml      | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!

