Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D456826AA88
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Nov 2025 17:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762191212; cv=none; b=rYynBvXE14/9QoLrH3O1cJYm15TgURcS7vSUpqpgqcBjr2KjoGu0ch8/K0RDxCTRn7hhY3dK13c/Lciev0/Ifri4gLoDv1fJ2ki+aMOyjPHMFB3sJd4CZ8eYZVdEMisc4EglGIZmklkrU+De3USZkHxl4iz2sMn7/7NscLQH8e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762191212; c=relaxed/simple;
	bh=+o5dV5iJcb6acg+vuRYXWjvoxYCIxuxArBBgYrKL5qg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XzKP+azfDlxo/jIq02RETbqU7frO3V9PAlNPke8/zFU8fEct54dk0jGwftPW6sP9CvN0+2m8w7e3I+SYhPhbIu1z0sSg6Cm24YCyeFMRfqm971TJvjAIVzlewIZn+f6rIF4FSzjWMiV02wVoIaWWWV4HuQ9B+mz/EUnGoDBXoNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l64bn1uh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l64bn1uh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733CEC4CEE7
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Nov 2025 17:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762191212;
	bh=+o5dV5iJcb6acg+vuRYXWjvoxYCIxuxArBBgYrKL5qg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=l64bn1uhzi4UXNLPwabx0bXjOyAkO9VVfL0LTdtFR/2gX7cNFuxjdk8tlJHEMHpyM
	 owLu67ClCwCfmon160zMBZN1i+AStX68zSifyc49ftP6AKQnREwma9qBU5iB1lNU9V
	 16vZhgTAVAA/uuZRiWm6J8hR8zpZEqyVMOUJfKLNMe+KK9VNvR+MyORJ3OnJrCl9QS
	 P6P4/MfQvzG7x0E0bAAoNX5iHdEHDxx3wQiGF2s/bnV19PgVmeuSMHc5as3RajIj/l
	 THOP74aC6hSLmKPl0TVEtuuJZN+Nyu95idQzisimIplPIKvPC/3rQoOMfciCDKHKzW
	 Z8VQYd2IIwA2Q==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59431cce798so750681e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Nov 2025 09:33:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX2keKYhP/gPw/W046RX0ErAgWSlpwGJb2dMHf8rqSGECN1yRp4RDSt7YYHQ3lowXv1lVYnpQ8IAzXPag==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2Dlp/aHzJNbOcoPaVGy+UybptM0GbDas6kzENe40SSnxw7Atj
	YytX8WJV4BWTaY20qHffMGpERD1osDAw00zXlUkmLpjIvy179C6dnGCbczAKcDriTwoG07BxjFb
	BJcK8Q5DQcjbcyv5LdgJJPLhwmWmEEGk=
X-Google-Smtp-Source: AGHT+IHeAV6gvUZakhroG+cdQ4cS//FtPIAPmnBlEfHgFaH6azoAUjYMPV9zLQGb7u1TcrlPCM1uYxkpaGVsOmKJEms=
X-Received: by 2002:a05:6512:63cb:b0:594:253c:209a with SMTP id
 2adb3069b0e04-594253c245fmr1658107e87.14.1762191210885; Mon, 03 Nov 2025
 09:33:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-30-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-30-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Nov 2025 01:33:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v66+oGwTnu_wtLwjcR4R6Owpb3PY5YTAoN0VUReB5+JePQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkzN1dsVffW7_6vHF-fIc5cl498aftDpvEUp2fdEJedEOeYbOYD0a_NxwI
Message-ID: <CAGb2v66+oGwTnu_wtLwjcR4R6Owpb3PY5YTAoN0VUReB5+JePQ@mail.gmail.com>
Subject: Re: [PATCH 29/30] drm/sun4i: vi_scaler: Find mixer from crtc
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
> With "floating" planes in DE33, mixer can't be stored in layer structure
> anymore. Find mixer using currently bound crtc.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
