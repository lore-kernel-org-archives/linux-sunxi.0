Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDB21DFD9
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Jun 2024 15:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719068660; cv=none; b=tiX0TG2h+mHIM/XhAhj3duzwmslRiqQru/qBQZVSZRHgtJHWlF2h44XLHT2+s1tgc2j2G3HAVXARNeLQ9hMYpDHGjZcp3uDltX3I8SaWfyPEA6hsoDrtd9r8g6sXixD0w6aggKrG9Fd4B8DTvnz4S15nG2G3JoQ6kr6u9xiwK8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719068660; c=relaxed/simple;
	bh=ts5T2EDHmcIaK5YoLHa0pe3FEjBdsuNcFPIc1cPFHr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbKSg5t7DMLpx8NF40EfPfPlXfGCEXmvSeHVlxa6aPf+MNfJhM5w69c+3HVUaPTOT6eNKY4iws6zxUXclVwltY+8ZAOw4iZ7Bh5GP1l55A7NREjncW4EkHtD0y9YE+KHPrhvsSKEB/5CjHMUsbaz2HF7YxHGZ9uEJkjAqL4+JOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52cdbc20faeso1404952e87.1
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Jun 2024 08:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719068655; x=1719673455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w3pQI0IJb3XskaJTRAaXxNB3TiCh4pJLT1XJMeA9sFQ=;
        b=o5mW4UNLsK9BLIBkfmYzk1C1DwyykAyZ5XW/w+NOfcBnM9VzkfM/Ed9yoXynxldRdv
         j+I9thYtpKCqxNPU3J19fIxkaY52lsNZp1wGhx7TPP5DkN0Sf+oYJJqbz3do0JRp7agc
         OhUczw4CT1qhKiNn8nzyzaCKE2vWvPAbPVwbjTsxle1cCWgwShPjveHbiuGvs8yBa6TY
         ptjZzD7bmZN0Pz2TFVBeQy4crG3hkX3t4+2v15oKwR1g5TMi+/lM/WvCEZxMHqFhPjJB
         5H4Lr5wiEGIzNqz5WQcL0gs7LWmoG77AiOvU6xMn0Hm7OIYT0fVoocJSD9Im8TdbmsQF
         4fZA==
X-Forwarded-Encrypted: i=1; AJvYcCXiX5I0LJUpk9M4tOqEno+mw8BAfO0QFMaz+DQh0hEtLC4FwzGueOq4ZDoIYzvUw7nTxhxuelKZ7P4X9RZu+ywkeBXixOBOp+NoUwA=
X-Gm-Message-State: AOJu0YwgfIzr8Ocevzzdx0J/549VQg5Uc4gjonhVmfcgFPh9zO9VAIJ/
	D0tuOWsYNG0R9GlbnKp/CrU/eUQnZzfcymx2aZNcBkyifSydek5TLCZOFGpe
X-Google-Smtp-Source: AGHT+IGcYjPlJndUzSLyS77sYMnTdCSURTKXadVUzPDiauBjuPRIFJcLbod2YHdxANo8uyk0onqMVw==
X-Received: by 2002:ac2:58fa:0:b0:52c:d7d1:7398 with SMTP id 2adb3069b0e04-52ce1834ef3mr33982e87.28.1719068654929;
        Sat, 22 Jun 2024 08:04:14 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd6431f83sm509756e87.216.2024.06.22.08.04.14
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 08:04:14 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ec52fbb50cso8854501fa.2
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Jun 2024 08:04:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwxbDLh6CzE0AHNEg/fDRe2krvBij/O+BxaAv/+PHigpBtct6UkEXtLWtrzTNfqkiRu/G2nZnCUgEn7WMLBRkFrhf1G8sdm3ONqXM=
X-Received: by 2002:a2e:321a:0:b0:2eb:f472:e7d3 with SMTP id
 38308e7fff4ca-2ec5b2840fdmr605451fa.6.1719068654651; Sat, 22 Jun 2024
 08:04:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com> <20240619012356.22685-4-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20240619012356.22685-4-laurent.pinchart+renesas@ideasonboard.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 22 Jun 2024 23:04:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v65wK7+F8zfkk7vpSri5o8T7XKtJGxe6ftUA5_a43W3jGw@mail.gmail.com>
Message-ID: <CAGb2v65wK7+F8zfkk7vpSri5o8T7XKtJGxe6ftUA5_a43W3jGw@mail.gmail.com>
Subject: Re: [PATCH 3/8] media: sun4i_csi: Don't use v4l2_subdev_link_validate()
 for video device
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Eugen Hristev <eugen.hristev@collabora.com>, 
	Maxime Ripard <mripard@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 9:24=E2=80=AFAM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The v4l2_subdev_link_validate() function is a helper designed to
> validate links whose sink is a subdev. When called on a link whose sink
> is a video device, it only prints a warning and returns. Its usage in
> the sun4i_csi driver is wrong, leaving the link from the sub4i_csi
> subdev to the capture video device unvalidated.
>
> Planned improvements to the v4l2_subdev_link_validate() function will
> turn the warning into an error, breaking the sun4i_csi driver. As an
> interim measure, move the warning to the sun4i_csi driver in a custom
> validation handler, and drop the call to the helper.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

Acked-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers=
/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> index dbb26c7b2f8d..d07e980aba61 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> @@ -35,8 +35,15 @@ struct sun4i_csi_traits {
>         bool has_isp;
>  };
>
> +static int sun4i_csi_video_link_validate(struct media_link *link)
> +{
> +       dev_warn_once(link->graph_obj.mdev->dev,
> +                     "Driver bug: link validation not implemented\n");
> +       return 0;
> +}
> +
>  static const struct media_entity_operations sun4i_csi_video_entity_ops =
=3D {
> -       .link_validate =3D v4l2_subdev_link_validate,
> +       .link_validate =3D sun4i_csi_video_link_validate,
>  };
>
>  static const struct media_entity_operations sun4i_csi_subdev_entity_ops =
=3D {
> --
> Regards,
>
> Laurent Pinchart
>
>
