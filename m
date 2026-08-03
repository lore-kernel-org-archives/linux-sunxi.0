Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6200C2877E8
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 17:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776681; cv=none; b=lISgnmw+vCS6wTD/gVT85U0TYuPETnM61ZcFIk43eM2NZDmEUIFsh/iVlGUp+YjpUegbc+wEFzveL3IQdrqwyIJEf5Q7+SUrV+EeBKEmiASNboGWsGPt9VEFrB2iM0OwgR9IcgqmulF8lkqG1CPR5kHB6HGMttVw53kqaLgeDwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776681; c=relaxed/simple;
	bh=Ldn7JWAjIAnCHwL0TACXiw3tVYiXkC8FD8f3uICQv7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=laNx95VdZH1r70meWOcwzQBJHs9250g5V/MY19wne4NMSk4eusix7sGH2J8fYftzahCPBod7Hl90k3k9nABfnQPKiIQRPaBWOxKkC+z/QGr9ACW/juchJZruc04NqeGGRqzqd+YDiFXERj6ehNQeHYyqVUjLoVRb9rTIgB6ZbgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilTz7EDF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilTz7EDF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EBFE1F00A3F
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 17:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785776680;
	bh=n/iOnG2AgOH05ZK960YynpPzVU3vp84xiLR+imEY/xU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=ilTz7EDFtHNfXmhP/huN5N3HdbumDZlyjG48BjpB0rHnz+2bHocp9RaYN5/k0mvv+
	 /RpCo6h94xPzJDdW6dsL0/F7v6ZlGg071Adj9WrXCLBjHEerHHzGMqXOR6RymX4CLA
	 MVZ2ixLXG97fZHiSD4BgmMAHviwcSrpBGPjwGss1YwXOCHpOs5T5kfHU7crMrS8Jsb
	 zK5NqGgx1jDRnhh8xWeaq0w7eJVPpJNNj0qY8Db70C5K8jF6KYtGGUFSNgBf83J1nn
	 B/cudKs2WY5dMxxrqQ/Mu8Gvt3MtRlb91sv+3kzur2ZtGcdmBWuzVTDrIrHlw8nlKN
	 30fx4qTuaQ6bQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39f1ac13687so24753691fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 10:04:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqjskLOKj6Nncb/I0IDIFo2G6N751gLA0MOTAHUsdVYYX10kvjvzxUdWgxlAQIECqS682JGyIEvREGOEw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzI25H+Z6/IylWNIh+M9G45bHOI8GpsFPlMTbAplcOigsNb0xKh
	S3bKfPnNl1poHsKqryKbM/bTAriLSZr5CvW44Wf0BHS75y1jFElT6kgK8HsK2WAAi9uQCNc19qa
	w6HJ3k/KzqwgqR4C4T39m4urCb9U2/eU=
X-Received: by 2002:a2e:a593:0:b0:39b:4371:dbe6 with SMTP id
 38308e7fff4ca-39f8616c4d5mr23211641fa.16.1785776678644; Mon, 03 Aug 2026
 10:04:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <3f5ec952ad80cb51efebf2fe230df50259041a23.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <3f5ec952ad80cb51efebf2fe230df50259041a23.1785772659.git.jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 01:04:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v672PXcS7zLtGLrVQs0D00Pvh97pUo=tgPMCswJMbg7=Rg@mail.gmail.com>
X-Gm-Features: AUfX_mx02KEK-kEu0E0pYT9Oatt7b9Hz1g3PJFr357J8Y3_fc2ljcAF3lcI4DE0
Message-ID: <CAGb2v672PXcS7zLtGLrVQs0D00Pvh97pUo=tgPMCswJMbg7=Rg@mail.gmail.com>
Subject: Re: [PATCH 09/13] drm/sun4i: tcon: Drop remote endpoint reference
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
> sun4i_tcon_of_get_id_from_port() never drops the reference taken by
> of_graph_get_remote_endpoint(). The function is not only called during
> bind, but also on every mode set through sun8i_r40_tcon_tv_set_mux(),
> so the leak accumulates.
>
> Fixes: e8d5bbf7f4c4 ("drm/sun4i: tcon: get TCON ID and matching engine wi=
th remote endpoint ID")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/s=
un4i_tcon.c
> index de2d66623f7a..67047e3b657f 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -972,6 +972,7 @@ static int sun4i_tcon_of_get_id_from_port(struct devi=
ce_node *port)
>                         continue;
>
>                 ret =3D of_property_read_u32(remote, "reg", &reg);
> +               of_node_put(remote);
>                 if (ret)
>                         continue;
>
> --
> 2.43.0
>
>
