Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992CA28466D;
	Mon, 21 Jul 2025 09:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753088613; cv=none; b=OJfZtS+byKLE6IhNtsQOf+iuRK5w8aciFSMMZQIhP+b/n40FHf8nsVPDTOKH4y1kzd8uqIej0KA20fjXVUzffkJo49Jf5GujdP69xisce+y9gbAzKvF1P9L3izvfRtgqkQi3EglFtIC0/YelI2hwQ67yr1TJNKhOy95sphgH04E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753088613; c=relaxed/simple;
	bh=2WyU0FIwwAaqd7wKJ14a9HbxLjKc9PEgGxTV9aHjfwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnCMNsHCpg81D9/OUhMICPwuub4GVZr0Eb3k+D++Rb/NRflKdLIHXWeQFaQ0XrqX5aC7O/6GX7sFtYb/Tf5Voe121iCLzM5xzIwD8eex/audI6pqe6xYFE/jsU7Xa6MPcV4U5g0JhvkIGvlul1WtNgWydSHaIRZgrx4V8mX3RDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HkOy6hTH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HkOy6hTH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91394C4CEED;
	Mon, 21 Jul 2025 09:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753088613;
	bh=2WyU0FIwwAaqd7wKJ14a9HbxLjKc9PEgGxTV9aHjfwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HkOy6hTH5OkSNlT+Ks1wifmkI4AbOHdrXmvPN0zXOiYQEw8c30+iPdqSyFsAl2LKV
	 gEIl4zbosH9WaOKEquHdrKFCkwi2vfa1AQKd6127Vl9woCogY6Yy6ZF/AE9wagCw7b
	 YIJ0OvPYGoa3JLETOoM8wTwgqei4JM0gQ+3EzfGrcNbMuJbMcZOlkenp9Zv5NpdU4a
	 vl5UmzhnsZ7a4Stjzkg47tMX82ydOP7X3YKDUIOQtTLwnGF3ySqhccVuPrIa2y6KL0
	 9nabpSOiCrhhX+GCnafaIiYJLEvmYt84BSfIbaWorS58FnF+dSIoUX4Xdrz4PFw6i6
	 9ssz9OAyrbFTQ==
Date: Mon, 21 Jul 2025 11:03:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v2 04/12] dt-bindings: display: sun4i: Add compatible
 strings for H616 TCON TOP
Message-ID: <20250721-heretic-solid-firefly-05ce87@kuoka>
References: <20250720085047.5340-1-ryan@testtoast.com>
 <20250720085047.5340-5-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250720085047.5340-5-ryan@testtoast.com>

On Sun, Jul 20, 2025 at 08:48:42PM +1200, Ryan Walklin wrote:
> Add compatible string for allwinner,sun50i-h616-tcon-top with a
> fallback string of allwinner,sun50i-h6-tcon-top.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> 
> --
> Changelog v1..v2:
> - Add H616 TCON TOP compatible.
> ---
>  .../display/allwinner,sun8i-r40-tcon-top.yaml       | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

