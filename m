Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB281BF804
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Nov 2024 15:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730735838; cv=none; b=POCsFU2aiUTB/HVdPZ7TKcG/1kJdTi6XmGqlV2ijX4YLJLObUnqVgDrXWGPyK52++hxEcwFD4StfFcxQ53nbjSd6NFwHFZlHYeHrbC6CPN5QxUOwtyK8ji8uPmMummmJuSuL3ElUCzBEDBSji7HRyLwLg77KQPTAatYHhOmRbqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730735838; c=relaxed/simple;
	bh=du3D9Ti6JlIpp3Bx+I1pxH4VeSvLJQ6Ys6/W+ho9O+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUdZWZRWYQlP7z2sJqOI2WR7+x5jfhCi23y0ROPPntdLhJsuj6VFnVEZweVa0EZt6E1zU1RTT4FpZKRDhs2tClZv3+iDgEL18gitfIi7wdJL2z53ZOmTn1LAh2Zuob3eWoVH+ZRz9cwzpjqE69XgT8QGwFkNmApfrIi7zAhXnK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WhkgX+5D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhkgX+5D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB991C4CED7
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Nov 2024 15:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730735838;
	bh=du3D9Ti6JlIpp3Bx+I1pxH4VeSvLJQ6Ys6/W+ho9O+k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WhkgX+5Dt2lESakf8onXXzW7cZ5C/VqXTnynUXelk6LMEmiXhiiS5uKvIiglYRRQd
	 r9RgkSZwoBub61J/vu+uTCqUEU5Ysp0D09w42GTSBZWCxX1EfAehu9alRA25tch2LA
	 f0lxhUclCAfrEgeCiP7XMk73AL1jAXLjj481hlXxCSN67ZjIMUU0zsbjfEbevIoMJ/
	 5WrBNrm/zPmv3jByyuHyNh2s3y8gktj41YrXr6X8tTIgUsbLAz6duPWeSGogxZ43h5
	 iX9Q6SKBCIk9tK5vr7TMzpOKsV2UaAlMIR8AmfYR6NIq/rmyqePpo/iA+7ZCt7RwqH
	 axASATQSWEtlQ==
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e28fe07e97dso4350589276.3
        for <linux-sunxi@lists.linux.dev>; Mon, 04 Nov 2024 07:57:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYFbHUiMQIUags8tmfOmKbgoM+QD6nWM1yUHj3gNEx7E94NTu0tSLi5jI0isQtxL5fVzvGVwJYZ/Vumw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQKC7fSzI5oBdRHi4Y1jtQmRL9By0EXVgz7wVaOB2SWu3ZOkow
	HzZdE9LY4ZsEjAiWHV6vItpbwsCwNKLnBImKvba/6WETVGmyoMlVl471MOJZI5uItBP8c4DGZsv
	G7LYNbW8BBgfd7cS6kqV1D9mMow==
X-Google-Smtp-Source: AGHT+IFJthhkSzkBdnbiB5dDIi1s/eaCvQbG6JsPmn7TbVCmrz/zQ6MVdpFKk0iB6A/Zy7+RL9YE/wF2HoO/7hQxgz4=
X-Received: by 2002:a05:6902:3188:b0:e33:25e2:4af6 with SMTP id
 3f1490d57ef6-e3325e24e4amr5209097276.6.1730735837784; Mon, 04 Nov 2024
 07:57:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241102125712.2647325-1-csokas.bence@prolan.hu> <20241102125712.2647325-3-csokas.bence@prolan.hu>
In-Reply-To: <20241102125712.2647325-3-csokas.bence@prolan.hu>
From: Rob Herring <robh@kernel.org>
Date: Mon, 4 Nov 2024 09:57:06 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+BFBTUT_VrkmCTV-XBmNvscGF0Bzfj7LEeytRea55aBg@mail.gmail.com>
Message-ID: <CAL_Jsq+BFBTUT_VrkmCTV-XBmNvscGF0Bzfj7LEeytRea55aBg@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: sound: Add Allwinner suniv F1C100s
 Audio Codec
To: =?UTF-8?B?Q3PDs2vDoXMsIEJlbmNl?= <csokas.bence@prolan.hu>
Cc: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 2, 2024 at 8:00=E2=80=AFAM Cs=C3=B3k=C3=A1s, Bence <csokas.benc=
e@prolan.hu> wrote:
>
> Add compatible string for Allwinner suniv F1C100s audio codec.
>
> [ csokas.bence: Reimplement Mesih Kilinc's binding in YAML ]
> Signed-off-by: Cs=C3=B3k=C3=A1s, Bence <csokas.bence@prolan.hu>
> ---
>  .../sound/allwinner,sun4i-a10-codec.yaml      | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
