Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2325342BC58
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 15:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127853; cv=none; b=NeH/U0SVjCdNbulwmarVY3uNazRjikb+h69n86c0jy1S0i4fLK7eJSpi8OAdCS2dXzWHED+yiZn6oMNj/35eva5KqZdtMmQeAFDWuExC0zoIHPLrzhUXy8jQUBaIiVZ59lzsSP9QolXDLi7WinzMNYi2qQIQsdOfCUuzLlaUfCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127853; c=relaxed/simple;
	bh=Uc9ixU7mpRtpCs70jSp612g1hyAczHyKoacPjXdxzoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YsDxO3yVPNIC7wIyRk2/riw2FDRvzv1L4MCDhxv6kkZMjnAuwS6Smflc4fRHFSYYRUTkm7JWLAozv9ZSxIviwWfCfVu1pS8yLSTBaY77TmV350bGwvZ3DVsGAUU4zL9LTq9m3XTJFsJd/zQsjkKDXM6FBRnrF0R0CpLQBOaQISQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkZrl/va; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkZrl/va"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D30221F0155E
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 15:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784127851;
	bh=Uc9ixU7mpRtpCs70jSp612g1hyAczHyKoacPjXdxzoE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=lkZrl/va3yl6Q4VJC9ZefqvyJ4sx07gRYONmK6vWlBWL8XdKuvfHMxPJdYeM4YjuX
	 GKZ4xMRJ3XfaK0LI4OM1RQe7PG5uhjgRFY0EIdDY7OFzbzMSXKZHyrOPvYurVpseMh
	 dS26ABRzLqtUAmOSFGhQcauKcuCAXsB+4u4JJ5d3uHn7KWHd/6YQducbRzIS1cuQKA
	 EBTFm3xFSb17TEacdM18qE7rmvj+RI0YAupvqoXj0nliCH291Ik1zmra1LIbTJ8ku0
	 Xg2bBohiyv4kBv6Xe0+B2JCTdqaKs9yF93n037UfBlYkVdbWq9IKrhN2EPPhAqnZXu
	 VhbeYU9pQEh3w==
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4a496b6cc3dso413272b6e.0
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 08:04:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr+7Dz59Gt1tw/ESRTHTGh5AQdmv3rUG3w+TYMLWEBaimphxihopjOFBalGemix9wxRjyed530aELVKPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEU9OA085H9h3ySXQcAhxfA3i6QSMsXd4hHoHcudcT7B4EIQ3Z
	fUFNTWC7kTQOi11WoYnyQW3IxxSIyAr/eZwXxjA15cdF2bnXFNqDnCOGJLq1FFc8+Dv0Ho9Ridh
	sy/8p6rnIzICWV8//LqH+3tezmMR+EUg=
X-Received: by 2002:a05:6808:1703:b0:497:e39e:a002 with SMTP id
 5614622812f47-4a47a72a883mr3694530b6e.30.1784127850988; Wed, 15 Jul 2026
 08:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715095525.40668-1-phucduc.bui@gmail.com> <20260715095525.40668-5-phucduc.bui@gmail.com>
In-Reply-To: <20260715095525.40668-5-phucduc.bui@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 15 Jul 2026 23:03:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v66nAAdni7d5-D0iT0qDaA0evzu6KdtE+BmVw=9Tw+vQ1Q@mail.gmail.com>
X-Gm-Features: AUfX_mwt_greS7zKZg9j8B0HbmtSXlCaT15WYQ9IZOCzMApLlmkpzfRkYHxh7Ko
Message-ID: <CAGb2v66nAAdni7d5-D0iT0qDaA0evzu6KdtE+BmVw=9Tw+vQ1Q@mail.gmail.com>
Subject: Re: [PATCH 4/6] ASoC: sunxi: sun4i-spdif: Use dev_err_probe() for
 probe error handling
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Chen Ni <nichen@iscas.ac.cn>, 
	Marcus Cooper <codekipper@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, u.kleine-koenig@baylibre.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 5:56=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Use dev_err_probe() for probe error handling to simplify the error paths
> and handle -EPROBE_DEFER correctly.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
