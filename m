Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C14433937F
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785775812; cv=none; b=Uxy49lyzVhONdyCtY0AsD1Qfem+2TeZGnXAP5xKgmmAQEiNCKu4F71a6xD1tqubGUJ8tnQVARU/biJzySeUOfN7xLkkr4JJn48B0vt4W0eIwKFUPvqwB6S9vXAt7LcUVnmUGEVqdDkhfxqJ46zudNK/LEbmyr9QeLMYrlXAd85A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785775812; c=relaxed/simple;
	bh=n3x7DzLSw/RgXYSGL970AMez+t+tErL/PKh7Mza8XO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M9WKrbYEUFrvjKqojGXhl7Jjhx8I7SlcR/uhsGwe1VYqVE9ffJfQF53efeZro92XXKocEM4gTW+aSPi0BPOjNNFClikFBXlGlOhKUi6HeA5FfMsIKmw9s7lRmyMLpPRQ6RdDQyrTzAnrNWMXKusj2YXrYqqaBu6bIwkn3FGbWso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdUPXNPY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdUPXNPY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F166B1F00A3A
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785775810;
	bh=LqfMFvG39lKXqP4IY/jf6LMlXl3rblu3dHPXqWyDQ9c=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=hdUPXNPY/9SP3Vv3rKoCrAAtD8WStLz446kNjM6+aUw9ePntJumoOKf2FBbGys/9n
	 GHBrdkICi5QyvVy7LODwOAs+I0jbDYQ2DcjbZAHtY/y41PKoSFCY22R6+bNQtGSz0T
	 BvedpgRT2vS8NCWk2ktqwPekn2Rqw1Y3AW/RnWgFFEiXOmOslQldxYCKyqRO7M5HoH
	 P8/VsN8QspQ+ieU8/6EKnYKozeh/dWNctfgI4nx3uc/jQcRJ6qIyFr7+gVuS3PizlD
	 X081J50C6V8vsTuSDanqF0Ty/MwgizLsEvfr+bYIR2jMs4/vfluHFNvHBzBitFisoR
	 v2xXcUVVhHbGQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c95395230so35280961fa.2
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:50:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr61YShd23JFQCqQncfVKvk0qffQvqQ97zbhU0HKlcLEsgA5aA4C/k1YfL6xw8jXMpwzuJE1fkh5Qs8gg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIpcyqHobpBKs3yjy+ZF9cfJrtazQ4yA4WnC6e3+SChERoMlSB
	HBxJyS8ed5rJjUFWlgGmG0ufCj/E5z2rqMvehrRn7huyHufRFX9Yr6eys3PTH63kEYOIz1lkyuR
	HHNxVckpqkfL6PiqK78p7Sf89AiDjgrU=
X-Received: by 2002:a05:651c:2109:b0:39f:80a1:26cb with SMTP id
 38308e7fff4ca-39f8618e025mr23124651fa.15.1785775808451; Mon, 03 Aug 2026
 09:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <871a3108086c15a483eef23301984c8d2254dfa7.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <871a3108086c15a483eef23301984c8d2254dfa7.1785772659.git.jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 00:49:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v65cakBH2F9UzFez7oaSR+FdaEE9jd8=EVwqYppEv+vT_A@mail.gmail.com>
X-Gm-Features: AUfX_myTSWk3Vhh1B8YIgS2HNj92bAoaOYw3A_kZOXp0hMmKDaNs9ozAJnm4yvY
Message-ID: <CAGb2v65cakBH2F9UzFez7oaSR+FdaEE9jd8=EVwqYppEv+vT_A@mail.gmail.com>
Subject: Re: [PATCH 06/13] drm/sun4i: tcon: Drop TCON TOP device reference
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
> of_find_device_by_node() takes a device reference. Drop it after mux
> configuration succeeds.
>
> Fixes: 0305189afb32 ("drm/sun4i: tcon: Add support for R40 TCON")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

Though I'd probably rewrite it with

    struct platform_device *pdev __free(platform_device_put) =3D
            of_find_device_by_node();

and then all paths can just return instead of needing the goto.

> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/s=
un4i_tcon.c
> index ea7c90fef316..de2d66623f7a 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -1409,7 +1409,7 @@ static int sun8i_r40_tcon_tv_set_mux(struct sun4i_t=
con *tcon,
>  {
>         struct device_node *port, *remote;
>         struct platform_device *pdev;
> -       int id, ret;
> +       int id, ret =3D 0;
>
>         /* find TCON TOP platform device and TCON id */
>
> @@ -1432,21 +1432,20 @@ static int sun8i_r40_tcon_tv_set_mux(struct sun4i=
_tcon *tcon,
>         if (IS_ENABLED(CONFIG_DRM_SUN8I_TCON_TOP) &&
>             encoder->encoder_type =3D=3D DRM_MODE_ENCODER_TMDS) {
>                 ret =3D sun8i_tcon_top_set_hdmi_src(&pdev->dev, id);
> -               if (ret) {
> -                       put_device(&pdev->dev);
> -                       return ret;
> -               }
> +               if (ret)
> +                       goto out_put_device;
>         }
>
>         if (IS_ENABLED(CONFIG_DRM_SUN8I_TCON_TOP)) {
>                 ret =3D sun8i_tcon_top_de_config(&pdev->dev, tcon->id, id=
);
> -               if (ret) {
> -                       put_device(&pdev->dev);
> -                       return ret;
> -               }
> +               if (ret)
> +                       goto out_put_device;
>         }
>
> -       return 0;
> +out_put_device:
> +       put_device(&pdev->dev);
> +
> +       return ret;
>  }
>
>  static const struct sun4i_tcon_quirks sun4i_a10_quirks =3D {
> --
> 2.43.0
>
>
