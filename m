Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123D838AC7E
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 17:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785777038; cv=none; b=pXtfzUso8kCUTx6NI577slgOosSv4Lzx2l8X2Ze7daTpXMVafL3gBGWIWHF578QLreaAGm/waX/Ea8YqihLHftQfaIiBkjmGTWyulwmXbmLhhlAfF0TRTNa/bzvk9s9HP0N6y55/uM7U7S4oyUyk3tc7UNcj4TM5dchZX4ZooGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785777038; c=relaxed/simple;
	bh=ATFrN0uwtrPvVz44g7zx4IHW4RffoXrJayvHEXfCW7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/PyEv2gsDGak7I7JR1JN+4NdrluYQNqRo906878T42Z9hIM18zIExbD7g6dGEs+zsdsd/7/iMGGYKHAtzSbr+ckleJ8Y4YZgIGx5lPv6EWttJnYLX73RQcftS0nSf2H36hDxHW9jPh48XemXEEZzXzNUHbNMk6BVCCv6+GQB5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOr794kI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOr794kI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1A01F00ADF
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785777036;
	bh=doqYgb+n1+MzYaFBkm0Z2OZtZJMR4/CPw3oK9XHvRn8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=eOr794kIfY7W46iYnnLxRi118Vzcbg5sdZLUGw8OGSnDbs1p7MZ2Ldhbj3haxzko/
	 yzTY9dPWS0RMMlQV4lxj2OoVbIcTJvN/othQoHnVe801TzUUo0JFOtu+/iHTGpWMi/
	 Rzx2A08ukI8cx1n5taUtGS9EEtHLSA5yuq7o7fJhmtPAWersXusVQeoVbb4BWl0HIg
	 juRcwHPOdd5zwWfjrlnnqfGmr+B6M9jn+J5H0SNOyaSF4VgFoaspl5QchpzZNumLMU
	 LU+jaoyNSEpdss+sJdFx50CC8qA/8+w7mQN2HkcxXGrDoiVfJ5B96XGq1yddYAYVhZ
	 4qmYRo5wtKnzA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c7ce122c7so32046241fa.2
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 10:10:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpSq1Z+Ppw8UHvQP8nXSvU3wlwUne6Jl97uqmbp2V7BXlFUfLMJVgpfb4gGymVGX6exxrfAZ49BQVKtKw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywv6dII8SI2T1LcNe3SxgXKsc42iLLantvXHGiKK/FWsf2jZsT9
	Qm0jbQam6R4InQuOPQujCI5TRiqaMHQKJJaSbY8gXagaoVhJceLBtSCDNi0Tr5QkZM5HRXxiO11
	a8X3/pPUPTmiUCLeXEatUV5p1eBMu52s=
X-Received: by 2002:a05:651c:a331:b0:39c:7294:edd5 with SMTP id
 38308e7fff4ca-39f86149fbcmr20474521fa.16.1785777035316; Mon, 03 Aug 2026
 10:10:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <759c74e3a22b97ca066ef7910ca4b91b852011e6.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <759c74e3a22b97ca066ef7910ca4b91b852011e6.1785772659.git.jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 01:10:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v65TCJTNNJCNHOrD5crXDHaB5xHk38OoU8cJYneLoK6WzQ@mail.gmail.com>
X-Gm-Features: AUfX_mwpcFy3zfeI7QO6fCWDy-K5pNTC3w93qmXynM_39UegKq3dSKNgaBP3zYY
Message-ID: <CAGb2v65TCJTNNJCNHOrD5crXDHaB5xHk38OoU8cJYneLoK6WzQ@mail.gmail.com>
Subject: Re: [PATCH 11/13] drm/sun4i: Drop node references while building
 component list
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
> Two references are leaked every time the display pipeline is walked:
> the output port node in sun4i_drv_traverse_endpoints(), which was never
> released since the driver was introduced, and each node taken out of
> the endpoint fifo in sun4i_drv_probe(), which stopped being released
> when the fifo was introduced. The latter is still safe to drop right
> after processing, since drm_of_component_match_add() takes its own
> reference.
>
> Fixes: 9026e0d122ac ("drm: Add Allwinner A10 Display Engine support")
> Fixes: 8b11aaface2b ("drm/sun4i: Implement endpoint parsing using kfifo")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/gpu/drm/sun4i/sun4i_drv.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/su=
n4i_drv.c
> index 8a409eee1dca..e9baca360160 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -289,6 +289,8 @@ static void sun4i_drv_traverse_endpoints(struct endpo=
int_list *list,
>
>                 kfifo_put(&list->fifo, remote);
>         }
> +
> +       of_node_put(port);
>  }
>
>  static int sun4i_drv_add_endpoints(struct device *dev,
> @@ -394,6 +396,7 @@ static int sun4i_drv_probe(struct platform_device *pd=
ev)
>                 /* process this endpoint */
>                 ret =3D sun4i_drv_add_endpoints(&pdev->dev, &list, &match=
,
>                                               endpoint);
> +               of_node_put(endpoint);
>
>                 /* sun4i_drv_add_endpoints can fail to allocate memory */
>                 if (ret < 0)
> --
> 2.43.0
>
