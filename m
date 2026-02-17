Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407D22D4801
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Feb 2026 07:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314829; cv=none; b=BobXTi9hxzBofmWfu7vSvl7zyLZAO1cpgnEii3jddah6m2X+cU4ndOLemrkYVENo9kz7tl73fwZ28QOboDpKAuVmcofNMzWkh6Mqq0RKq1Fygoh6LIZE4+7ba0CcS670jG9twQ44uA86UCCgEKiEv9ljdFyB0N0HzCeEVUjZWbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314829; c=relaxed/simple;
	bh=tA2t5oeOUZ8eAwOpBVyGbemY7+jVRLWknKxnMDhCYms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rHoo3rYcLuBuITGxZB3lmFHcNtKZEHu/mKsGRkcATxJpicmoSvKPWBaon/ZgDg3qZYj8FxVfWWI4yiStd0jFZxJB/Cv6gDOLo34pPqZGyt2O6JSUZwUMfYAS3bKz4hc3+Y6TSQsHJjbNSwJNgUPlVWpmb6tsRhivGo2pKKYInZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNnvFNt8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNnvFNt8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A41C2BCAF
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Feb 2026 07:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771314829;
	bh=tA2t5oeOUZ8eAwOpBVyGbemY7+jVRLWknKxnMDhCYms=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=LNnvFNt8TzdVxP6kq+X0upGc19BXHfJFty3jpW6tHWQJBEFvfpyonpjVgsx+jJ8mW
	 OhxWML1LoAuUxm6+M0IARUuQl8IpXeq3+tOEtWsvJuEwOD9nRjWDP/3PsuMsv7RZQ0
	 xsb/4z/aHIf8IXV9W1PuBJDPsydg617d4nwN8d9c9v8y5b0MP32wNRAZT+Yeq1YnIF
	 tKMvS140nE/O7gk0LldojB8VqdP+gJKoyiKObJFg59UEgD+cQ5qxdiadZ1yhraRSTT
	 v8KRahk1cQUgDZRiKE/Ps5AcYuVJ6HpkkhH2HZ8FWx/l2liL76A5UDmxW0kJacNQvz
	 bLZC7NTveINRg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38706f96202so24713051fa.3
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Feb 2026 23:53:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWk9Zmg8xuZ5NtrVtYM/EPmb+kn33HKuIyyJ1m2PP+Or0bqQT9lptQuGup+YdLFdT+kXqn8WBxg6PMLfA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8sR0HbCIEDO8c9A7Zggrm/07H1fH5RdxVuiYINSqyfrm3iLvr
	yPqc8O28nFiVsjZymcJOtDxBxxt9Sap+F/SOg+M3a2/P/S2Wei0pjRimPWpk7mojzCslbQc1Ars
	LJPd0/iIrxBV3snLv5EHwVJm0Frorp9Q=
X-Received: by 2002:a2e:be1e:0:b0:383:1232:379a with SMTP id
 38308e7fff4ca-3881050bca3mr34254911fa.2.1771314827466; Mon, 16 Feb 2026
 23:53:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260217014801.60760-1-ethantidmore06@gmail.com>
In-Reply-To: <20260217014801.60760-1-ethantidmore06@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 17 Feb 2026 15:53:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v64iwahkDyuTtWo3YsdgExBu-fs8XRcsgPvWX5ETb=irtg@mail.gmail.com>
X-Gm-Features: AaiRm53D6IJmr1XrVqkJyD7FBEAc639vco0g_d6NG7g082rgVzjQ9c8XaAjLhcg
Message-ID: <CAGb2v64iwahkDyuTtWo3YsdgExBu-fs8XRcsgPvWX5ETb=irtg@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: backend: fix error pointer dereference
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: jernej.skrabec@gmail.com, samuel@sholland.org, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 9:48=E2=80=AFAM Ethan Tidmore <ethantidmore06@gmail=
.com> wrote:
>
> The function drm_atomic_get_plane_state() can return an error pointer
> and is not checked for it. Add error pointer check.
>
> Detected by Smatch:
> drivers/gpu/drm/sun4i/sun4i_backend.c:496 sun4i_backend_atomic_check() er=
ror:
> 'plane_state' dereferencing possible ERR_PTR()
>
> Fixes: 96180dde23b79 ("drm/sun4i: backend: Add a custom atomic_check for =
the frontend")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
