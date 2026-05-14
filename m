Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C2D301465;
	Thu, 14 May 2026 02:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778725412; cv=none; b=NT/DI9/68WyHYFyyBjZBCUL0y1optCJyfRqGmyY2siUuBJWh/RA0Aop7UJZ2d32IC8TuN3uar5R3ZGws5tGXM/NF6tCIwBGEgUXLHv9eeyaFWmiwYvm17yEwXflk11sOQlpRerJkFjWh8p6XAhZORRAfspe1kInZokDnfbbu0rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778725412; c=relaxed/simple;
	bh=wtIb58l+hszDoFptqKA0UUp+KOZKrrOlCFOBrzHMvMw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=plytzu5GgwfHGyO6sN8/mJqbWwuJkxi+zkdKoNAQzFQIdc9OxbX6lXjrvjpGRhHnJTfVOvP9MHmi0k4WhZPbxTADEXq3vK4k9ZjzzSqPZ7aJKiFlEsHiXQzD578q0pnYKsv23WEUZajE/oPW7mzZanTqa751vIgh++qCjpYmoUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XGrVcYkO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XGrVcYkO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E20DC19425;
	Thu, 14 May 2026 02:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778725412;
	bh=wtIb58l+hszDoFptqKA0UUp+KOZKrrOlCFOBrzHMvMw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=XGrVcYkOGN4jyAoNr3FehhVUg/bzHvjbSx6xXN4V3uCPghw9smWOPJ9l4y2gtf4US
	 VrS49jH0hB870rGWTG+bRmkKZq5eFG5xI+W3FIyxbmGwirTuSLyZ0jf5aTV2YAKBVT
	 eUS4YZhkH4QliBCe44vIlkg0SbRL1pDUY7y7PVLG3f/KogFgI9JLIvLogtsn67ay2h
	 oSv5ahksYmg9HRx3Zv9eA/st8xbg7fGtg3c+77rvixuryYWticUpKfFvB4oB8fla2c
	 kZpTrfWFzLJdAn0v1xEixnUVx082+5oozot7W/cmi7zVz1SQ/bhxegfNfjyh8ZujqD
	 mMOk30eHIgE5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: adc: Add GPADC for Allwinner
 A523
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Piekos" <michal.piekos@mmpsystems.pl>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260513-sunxi-a523-gpadc-v2-1-d5efde151dac@mmpsystems.pl>
References: <20260513-sunxi-a523-gpadc-v2-1-d5efde151dac@mmpsystems.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 02:23:31 +0000
Message-Id: <20260514022332.1E20DC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Schema Conditional Logic Error: `if` block will silently fail to=
 match A523 compatible string
--

commit f1e37c6efc76bc9bd352a9e8462984a80a03b87c
Author: Michal Piekos <michal.piekos@mmpsystems.pl>

dt-bindings: iio: adc: Add GPADC for Allwinner A523

This commit adds support for the GPADC on the Allwinner A523. It updates
the schema to allow two clocks for this new compatible string while
restricting previous generations to one clock.

> diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d=
1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d=
1-gpadc.yaml
> index da605a051b949..6467800d30e27 100644
> --- a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc=
.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc=
.yaml
[ ... ]
> @@ -40,6 +46,30 @@ properties:
>    resets:
>      maxItems: 1
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun55i-a523-gpadc

Will this condition successfully match the A523 compatible string?

In dt-schema, the compatible property is parsed and evaluated as an array of
strings. By using enum directly without a contains: keyword, this condition
expects the property to be exactly a string.

Under JSON schema rules, this condition will evaluate to false because an
array cannot equal a string.

> +    then:
[ ... ]
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names: false

Does this result in valid A523 device tree nodes being incorrectly rejected?

Since the if block silently fails to match, the schema will fall through to
this else block, enforcing maxItems: 1 for clocks and rejecting clock-names.
This would erroneously reject A523 configurations that correctly provide the
two required clocks.

Could the condition be updated to use contains: enum: or contains: const: to
properly match the compatible array elements?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-sunxi-a523=
-gpadc-v2-0-d5efde151dac@mmpsystems.pl?part=3D1
