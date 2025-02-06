Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FE92248B5
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Feb 2025 07:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738828571; cv=none; b=i+bxeUV1qbqEqAbf8JOdRdBj7vxcDro97P1s1YYaOhVB5PofO1a9QoeJwtjRdbh6KXRWWVRItLrNMAR72IIvxLKzhwCw5GkZdkY1QuJWBpRCnFTibLR8tmVgz6qD+LTk3Xj17GvymcoU4vBHCfx/j8VCUN1gf6gGRmCOJat6IKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738828571; c=relaxed/simple;
	bh=AEqIZa1c20GE/uxbotqVtezGJP1SyvKYBSzc37trZCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YoePQM484kLGQkkoI5hgXCPE4B0TfBDZ4Yv5Z1rqq/ih1uaFJN1moxn6IXnS1IstHzqxtbd+qJOPFnLqf2E+6WfJvsTJq+spOympZo6Zmir8xlmTHpv00dt7lTMTamjkJhFb3nAylqeNiT4h7mmxWU/MrCIjQjHEuWfGtPhYqLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mbUKCJAV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mbUKCJAV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72CD1C4AF0B
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Feb 2025 07:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738828570;
	bh=AEqIZa1c20GE/uxbotqVtezGJP1SyvKYBSzc37trZCQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=mbUKCJAVnd0gw2qkD0wGt5Xv3Dzk2KGOVX+35Yv+F0p6hPPIlRumruFvwrTqICD/N
	 x2t5shCnOeLv4YDriUkDZh8WcLm752b/HYA7Z29AhC7rWORWfg7ehS/+NQiBZXiWLz
	 /0kE6M0ldvEhx+bUce072yyFZSyoeh5c2HrDhsGy9vy5ODJMXv/W8JS3YJ+0+t+Cwj
	 ABlEUsziAfj8PCCRSSDJWExO5/2C1ml5cKCk414NCsfI3DS5eAZvstBqnGz02kVwni
	 sHxcHM3nuIPp+Kq6WRUDPpIYf+boA+2zhKm3TiW7V69lThAELBggeNyqwPnW6YbitG
	 gez1EFLTjk1YA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30615661f98so6657801fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Feb 2025 23:56:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMWWidxVr+lZ+ujGHm2uZqoJXVIfWLsG3eOaamu241kW7JVvaFJxoHrBGmrtgKlvl0jw+TxRu2GOqGOg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKx0LIBN3cwlbRQm8jADjepZlgCMTgQEitXluA+dl4cKbpfLl/
	440M02xPKDQx0VCefGGYYB7as8/qkzT+iEhzRIVhXE/amE6m0IG4BXta0T32O34CFK/P7OMmM1x
	zFtzpy7O9gIZg94A1qhrSoQVqm30=
X-Google-Smtp-Source: AGHT+IExYizR8AjRlIGIimdkZfX+9X0NRegGw1UkCfbyc+3a2hXIE82esqSCVnis8PSKgDv1Ot7p7cslZ7ZmlCRaP5E=
X-Received: by 2002:a2e:bc13:0:b0:2fa:cdd1:4f16 with SMTP id
 38308e7fff4ca-307cf314576mr19836061fa.14.1738828568791; Wed, 05 Feb 2025
 23:56:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250205173630.112020-2-csokas.bence@prolan.hu>
In-Reply-To: <20250205173630.112020-2-csokas.bence@prolan.hu>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 6 Feb 2025 15:55:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v66yUuG=P5HRgVtLL7y+W49pP6DS6sstQz-qY8CwztdT2w@mail.gmail.com>
X-Gm-Features: AWEUYZni_KKoOE4E3mzLNcrihoeiCPzzxX66FMp6It2qHidhpuTepzOXlYpsAbY
Message-ID: <CAGb2v66yUuG=P5HRgVtLL7y+W49pP6DS6sstQz-qY8CwztdT2w@mail.gmail.com>
Subject: Re: [PATCH v3] dma-engine: sun4i: Use devm functions in probe()
To: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <csokas.bence@prolan.hu>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 1:37=E2=80=AFAM Bence Cs=C3=B3k=C3=A1s <csokas.bence=
@prolan.hu> wrote:
>
> Clean up error handling by using devm functions
> and dev_err_probe(). This should make it easier
> to add new code, as we can eliminate the "goto
> ladder" in probe().
>
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <csokas.bence@prolan.hu>

Acked-by: Chen-Yu Tsai <wens@csie.org>
