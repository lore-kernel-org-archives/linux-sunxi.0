Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1332D6E60
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 17:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761587129; cv=none; b=HYiY4bCAa3hwZZq7swN8N7WRUgbSruSSRWKZ/i4vg4Ol0sNuRldR66mxZcYokyZvZQaPk2VTbBz8AuRUE39PzMNFsuH/fSJIUEgTIX4DSeHEYmzArUei7var6JROo6vv+d7guKaFdGgU6/TQPZVh56vVRCP0EOmBa9m4G2H3Ibw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761587129; c=relaxed/simple;
	bh=upm4Fx4Zyity5YEegKY8XfpMcrJf2ls4KbygxA0gOhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5ToZlcHnItuvmrQzLP3uBzAhxKfj4K2V+/NeMuQfYkvwOw/NzHFA9A+AymgJucK5+UVx+nr4G4idEAMdTNCUUjR0+3ohcgVvpc2JV9d2yXcX+lgKG1rvofwJJC1RLJ0NHF92uKAbC7uXtWeiaPtjJF5Q/C+KGr/Scdyxl3Km5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cj14kJH+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cj14kJH+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21979C4CEFD
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 17:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761587129;
	bh=upm4Fx4Zyity5YEegKY8XfpMcrJf2ls4KbygxA0gOhs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Cj14kJH+FRFQaq800dK+D2JysmG7w5AjqVnjQRupPGzirc9wn/yrC5Rcfe1Hx+95T
	 8iu2ONvQEsgLyKRwOVIy65cPnLYM87isb/TqYx6dNp2YI5CFb7lGyM6HHqrPsp5fZu
	 2b7feUFVAi8CrHg+TlVk+BlhzGBH4hQDO+RpV6FmDilwGj+/wpIUbRhOcaIcKMcFpV
	 ayfn++vB+0q1DQxHh1Yasy9l4D+BMOzs5zMCMbQF/j9d5I4hsR3Zz/Wse260cUKvCO
	 U7I0mY2P44ao6p/8ZDTqX3bF2L7mwgtBxky0EyTZVZJr2jU/xeXuJ1sBzpvidAmMXO
	 JI3WWuk0m5LVQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37775ed97daso59930631fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 10:45:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZAIHeiSYFZm5oCHfyAatYFMvZAjaStaFy7gjsrIy6nqYQkehsv07/dkp5+NzKTmn952mxmNKiHTiiEw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6id79BmVjPRrKQpx97aXo6b5EP0FWQeT7Lzej2hVkDJhUASKb
	6nw7CNRon9WG5Ru5GQ8UIj4QMrM8/H1lqJTEQE3FNnq8ZanVyQlVgGhDaoSQz4CSKkeEKj4E2U6
	EAHM12vLc62XAiByeP8SI+ixqwAg2FEE=
X-Google-Smtp-Source: AGHT+IFjlWIjfh9UvXhgPZoLIWaWRXGD/zpbLYult3MgsNK73imA2OTtKPUOEvbbhsWdoXcemdcDtRY3/9kK67MPTXU=
X-Received: by 2002:a05:651c:1585:b0:378:cd2b:5040 with SMTP id
 38308e7fff4ca-37907cb3b9cmr967131fa.21.1761587127507; Mon, 27 Oct 2025
 10:45:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-18-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-18-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 01:45:14 +0800
X-Gmail-Original-Message-ID: <CAGb2v66KBHkZZEkORAyFO5LPqSChBm8mUFS6bgiRZopze7JuKQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmRMHRbSFfLfGrgGggasJXji4AX31snSt1AiPTxbTOpwyHoYhtiWgiL24Q
Message-ID: <CAGb2v66KBHkZZEkORAyFO5LPqSChBm8mUFS6bgiRZopze7JuKQ@mail.gmail.com>
Subject: Re: [PATCH 17/30] drm/sun4i: vi_layer: use layer struct instead of
 multiple args
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> This change is equally a cleanup (less arguments) and preparation for
> DE33 separate plane driver. It will introduce additional register space.
>
> No functional changes.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
