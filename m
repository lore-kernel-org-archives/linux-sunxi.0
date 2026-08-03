Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A770841A4FC
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776738; cv=none; b=Lj4fGNlWNdwO2oIi0nqCPTWN8J5eBWHWGsjwdNwX/3NK7166NQ2I/VaInsJvR3AIrIk3HfbsVHED6ycslQfx4x6BBhhNKOJfyCKL+qF5UczZMgfq9Q6vSPGRFLEvWcZPF0aGi7s4pAzybktB4gQ0j74UMUd6Ob2Paz/jgteBODg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776738; c=relaxed/simple;
	bh=c2gfAZkyk4xRufN2QtIfS1D7YKImCe6b/UMEIBj5tRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWJbvZ26QKxYAP4rPRlwDuajh/lF5drk3CppMPnfdkQepRok+R6OehIA58/HQJXunL2rO5jIU2ME1szvXpZDvZPo2eAUINehjk+3ovZcAJLgQwoiixMmhUut6/QW7d2jPmP4bTP833jkX4QPWOq/qJEuXoY5IWQL2LR28tgPe9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9cvgNP9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9cvgNP9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F14B1F00A3F
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 17:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785776737;
	bh=c2gfAZkyk4xRufN2QtIfS1D7YKImCe6b/UMEIBj5tRc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=i9cvgNP9dhJ9/8hODj/v53iE5zr5IjnSJUupoeqUbKw3P2H0cfbsLBzGFGnTN/mtt
	 6KlL8YJlDpqGXQhMH0f30Tzg4TvF6JsrjO7Cg8Zf0hNW8703Lbc2QHSA7kHrvWQXhx
	 jDOhT+drKPuEcyZUrZsWtuPg6sj4ugxPcLXXFE8HbYxIpOWn/GZqmssSee36Yvztu8
	 ZonxqSyRQxl9FHnhYL1CZ6f0H/k33GA0iKDmJrvI+E0s6RrgA0o3XZW6iIU7C13QsV
	 VvTaVtsxFWNS0NRxNmxjRku1YnFdM9Fhk1DkJRr8z06EmyDOWjHJAy615q7H8zxsk3
	 EdKeCdPCCMGOA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c9452244aso35081131fa.3
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 10:05:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RouBnR5EtKzdXW0YAMJgK/eSjuuqFLUWGgJwb6fMahQTgUWlqXZqG6l96HYMUMv9wovLcwq/nj1G6QYyA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+8lxcLnHUf1aRrk3gwGzKUAxkMz5DhQCctJyquikgpjH0MRNQ
	0U57hhYiU7AgIQWQ9K765wJRVUBVnRkI5ddGVnhH7/BlQQYyLy8Q/LLUivBUxJez2rxUgKVt4Dm
	db+maM5qB5kQxDZzoTYllHW03BGENE/I=
X-Received: by 2002:a05:651c:986:b0:39c:828a:ec34 with SMTP id
 38308e7fff4ca-39f861773c3mr21982061fa.17.1785776735852; Mon, 03 Aug 2026
 10:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <43ffcc17f7c3f94c1d7bd1ee89134c766e84df35.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <43ffcc17f7c3f94c1d7bd1ee89134c766e84df35.1785772659.git.jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 01:05:22 +0800
X-Gmail-Original-Message-ID: <CAGb2v65c1EPRHV-Z6XzFZ5zzAktNe-Jwa4xVg+uEKLa53nyo+Q@mail.gmail.com>
X-Gm-Features: AUfX_mw5xi07aLKCN5EAF4HzTDdU9oLlVE2csye4cS9ilzpUotzn4YEaJKAhogk
Message-ID: <CAGb2v65c1EPRHV-Z6XzFZ5zzAktNe-Jwa4xVg+uEKLa53nyo+Q@mail.gmail.com>
Subject: Re: [PATCH 10/13] drm/sun4i: dw-hdmi: Drop TCON TOP port reference
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> When the HDMI controller is fed by TCON TOP, the port node used to
> enumerate the possible CRTCs is never released.
>
> Fixes: 57e23de02f48 ("drm/sun4i: DW HDMI: Expand algorithm for possible c=
rtcs")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>
