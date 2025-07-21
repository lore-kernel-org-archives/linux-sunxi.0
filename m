Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F7828A1D5;
	Mon, 21 Jul 2025 09:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753088711; cv=none; b=A9lXQK+N44d5eh58DLjTM9ODgmBDKCZzkUIGNivvY+bkoRUG2mLJvYB6MlhjNlVDydn2m21HAYzZy0RIN/94R0jPp6E0upJ5jzTkDXXJi70rFU/OBbmVzwYVZz9Opp//FoDhihcUUQd6aDJv9kT1vEl+4kgjsEYn35ZfPIDtLbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753088711; c=relaxed/simple;
	bh=mPz06fvHGJS3IqG6pR8pv22PSERO2G5DHxglf8CS8S8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFbw5oB6bmwDIbbYS2sfvskMHlkHDZDseQtqP/VjuCL1sMO0QNkwZ8QT/orAYJKWeh11/uWdKeERtPf9fddC55DTWHF+aKLa7VoN1y+httsYLpaEtcaiJ1sfRwLzX2CjI/QKxL3HRWkwxDK8f7ZQ54QtSXJDMsHokfW628xZSzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcLdB/5O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcLdB/5O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB0FC4CEED;
	Mon, 21 Jul 2025 09:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753088710;
	bh=mPz06fvHGJS3IqG6pR8pv22PSERO2G5DHxglf8CS8S8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PcLdB/5OATdpifzdPVHBnD7jY4ntBYQ+RoyAN3kug0ppoeuK5wqX7nW6oK3Bntx70
	 TeZan1U82ZkJOi7jjGEO8fmavhEDrS0r6H5n/VrgNXrhFyorNxACbd9Le+9k3h/gMO
	 gdH/v+ENMDfI1202+ct9ZKBzuZBK5r5fWhzzibbPykeyYv5LeB2/lXXzioaHJZZcpQ
	 fo5/x5z3lE0MsulrODgHIU+FtSdW42z6RDHqmFlVxUOrmFnJ10lOyAD41p7CPDSOeG
	 bZyl1g3zv3de+tGcAQ5XBIa+9iYJImpTSgl7nBr0tqZvj5cxUOMaSET4u94Ha/EMLr
	 3Mu77StA38p+A==
Date: Mon, 21 Jul 2025 11:05:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v2 06/12] dt-bindings: sram: sunxi-sram: Add H616 SRAM C
 compatible
Message-ID: <20250721-spry-nifty-bandicoot-c7c4ad@kuoka>
References: <20250720085047.5340-1-ryan@testtoast.com>
 <20250720085047.5340-7-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250720085047.5340-7-ryan@testtoast.com>

On Sun, Jul 20, 2025 at 08:48:44PM +1200, Ryan Walklin wrote:
> Add a compatible string for the H616 SRAM C region which is
> functionally similar to the A64 SRAM C region.

h616 for the parent device is already documented in the top, right? This
should be one patch.

Post complete bindings for the device, not chunk by chunk.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

