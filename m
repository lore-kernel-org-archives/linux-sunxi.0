Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E57D1A08DB
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Jan 2026 05:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768110548; cv=none; b=KR8jSC1W+AFYmPkmwK2o6moTsxhA4Ipd15ZDaRtiewX1Z9XOkZL2wtz2BqNBbYCzaKXu7/dXiAYHhIZqVnVHSqoNRv7hcqVlgrZGkfbRjzltAOmVuc0ODmNBp9GoG6bqxw02VNIKplusbUb0dNi29WHYUW5fNo9Lb09zvwbTraM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768110548; c=relaxed/simple;
	bh=f94E4L5SmOeYb1vuZvM5qXnRI7kcqN1FAuqd7C/lzvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qZcHMnCXpSTFHD/xFR1S/7HWcUFIb9+zFeOj+lnvprxj8Bgm+QXLyPVTRzf3eaKUnJOW0XHihgX8v2z9XE4m/EvhnzfUgsdkimHdMuUxrrsfj0zjhA9ymAPuOKRCCIK7O+8zlC3Er9lVncCyq88NdH9obcIg/T1ex6o4yk5hN00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOPJ9XMB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOPJ9XMB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F11C19424
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Jan 2026 05:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768110547;
	bh=f94E4L5SmOeYb1vuZvM5qXnRI7kcqN1FAuqd7C/lzvA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=AOPJ9XMBMYJ/lsGlGK+Ya3dlhbyqqxLWBl5MLpZ5CT17sg+jpfHJ1lSKsxCPZ1Ieh
	 1su01gPcE5ov38stP3uq68FqlB2VMDvKmRGR1LoIZWh8i71tbVdWAIqPrOuxB278FZ
	 lPtdI7hUwgmApup/21yz52TwlQAxrywEhu6KJj3cBGuPMfSaXOTkdUKPomLu9NWps0
	 hqSimvcDglnFiKIxO5to47f6VWAldVBwWXnz8J1/ZXNLmpX6kIbp1n3Q2fm0gL7uQ6
	 BFrdRUvbT4/+09fm07dbVY/5hnoknR5ze4CQ0L5cukTIcbnCRT6zhWKYcdgrGkQF63
	 /C96srd8XjXXQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-382fb275271so37143091fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Jan 2026 21:49:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdnSbG46UV8SHxAmEEu9OhsLghyacbhm5adroNzTS85SMQWWAfDk58VeWAOU2c5yVrt7qJIA7rQlr0lQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7dA4W6r/8fsDGvicu6bOR6ix7/HLRnDcMl5yZs0c14EcEmsYF
	+Y5AENLc5CnnGnXFnTk4dAjisL4JsZfE3jtYlMX8b+ynjGiyrM3r/8aFkBcezv9F+00IvQqfEpt
	QNr+rZ0IZEwbSy3f2POoCP48KrcWEAsI=
X-Google-Smtp-Source: AGHT+IGrD4yWVyakk5sWnBK/I/H1GUL7zKBVZOcSN9AR7czy2ZBJuisGO7mjKMC+qA1D0w16r+zMrBNAHJe06lQ7mTY=
X-Received: by 2002:a05:651c:30ca:b0:383:1c18:ae07 with SMTP id
 38308e7fff4ca-3831c18bad0mr22169581fa.41.1768110546185; Sat, 10 Jan 2026
 21:49:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com> <20260108-clk-divider-round-rate-v1-2-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-2-535a3ed73bf3@redhat.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 11 Jan 2026 13:48:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v65idCaa4ixAytB0Dfa_4ivc+AQ-c6pdbzQNAnLnzmipGQ@mail.gmail.com>
X-Gm-Features: AZwV_QhR5DHEaFlzpd86lAqTlAj0_MLG2seSom12NCHQycmMQplaKdXkzaZfMOk
Message-ID: <CAGb2v65idCaa4ixAytB0Dfa_4ivc+AQ-c6pdbzQNAnLnzmipGQ@mail.gmail.com>
Subject: Re: [PATCH 02/27] clk: sunxi-ng: convert from divider_round_rate_parent()
 to divider_determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 5:17=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> The divider_round_rate_parent() function is now deprecated, so let's
> migrate to divider_determine_rate() instead so that this deprecated API
> can be removed. Also go ahead and convert all of the driver from round
> rate type to determine rate that accepts a 'struct clk_rate_request' to
> simplify the overall driver code.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>
