Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09455280A35;
	Mon, 21 Jul 2025 08:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753086569; cv=none; b=W+jysGx3f5SxCfUr0G3CgvZR1wUAT7wtkqcbpM34hbqKMc2YQosqI0zWSQIi703V+Sy/k+HecSm/1+42hdCz3/EZ/sP+g03YqSJ9jsoRm50wrjOtkWwstTucKY+WQoi+UNGIc8qiMNziPx7giCVHeiygTkNStrXnAskIPOvWKbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753086569; c=relaxed/simple;
	bh=bkAFOrOZr/SvPe37BUtI1L5AwFmY9z3H9MvIusDOwfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzLpj9NvFS/VGOCAGrBCivyv3LaAOBRakAL4BwNlfAI3aj1cXa3SkNG1gYtjCRN2mrLUwwrBWqZpvwCr25g87t19fmpPe9MDoupiWZkLxJUTWrW/aTAqTpHWGharwFHRga+mH8Z4Ov61CffA55/Qhe+nsVfkFIYYZt7+yeUZDXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YwbDn7ou; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YwbDn7ou"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1469FC4CEED;
	Mon, 21 Jul 2025 08:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753086568;
	bh=bkAFOrOZr/SvPe37BUtI1L5AwFmY9z3H9MvIusDOwfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YwbDn7ouIaFxMvO+7i/Q+Sj0HAZLinB0h6iXSiEaSNOuvQDO/BAoqTJId9vLma4nA
	 CqjceBdrP+kU8R9RXl097f4i2Kzwi32a+f5JdwvxR7jcM5XCcPG+1yggEq1wiin0yN
	 6SfKuxlBNLrzaDS61079Uu90B4S5FmvrVK74Ma9xOy2fXJqVRyDwURxbFS18tKohhT
	 jPka0lp6B8sQxCC0m0cr+sYsPK5WwyhGUdlWYXIILoRwodvp8DXpzcRKJ9DqpzndtX
	 3pnV69bCidiZdHhvW+6XpkxPMoaaFxDItlbrrKxrThm3mWO11T+l4MYOPQ1SAELlJj
	 3vzYjCFl4XhRw==
Date: Mon, 21 Jul 2025 10:29:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v2 02/12] dt-bindings: allwinner: add H616 DE33 bus
 binding
Message-ID: <20250721-augmented-woodpecker-of-warranty-9f59ca@kuoka>
References: <20250720085047.5340-1-ryan@testtoast.com>
 <20250720085047.5340-3-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250720085047.5340-3-ryan@testtoast.com>

On Sun, Jul 20, 2025 at 08:48:40PM +1200, Ryan Walklin wrote:
>  
>    reg:
> @@ -47,9 +49,6 @@ patternProperties:
>    "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":
>      type: object
>      additionalProperties: true
> -    properties:
> -      reg:
> -        maxItems: 1
>  
>      required:
>        - reg

Then this is also not needed, but usually we expect here specific
children enforced by compatible (see for example qcom display bindings).
What sort of children do you have here?


Best regards,
Krzysztof

