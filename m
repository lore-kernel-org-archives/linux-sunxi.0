Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7234E15A1
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Apr 2022 00:04:35 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id k23so13183961ejd.3
        for <linux-sunxi@lists.linux.dev>; Sun, 03 Apr 2022 17:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YlBtLMwXDp/2aSzEQXf/0+zL7sSyqtfpT0RHI0yBN90=;
        b=P4r/SoegNEr9VInkvurtF58MXhKjhQiVDqJpUu4jIYfBoM7fRxXVKY3XimQ8p1+Ht6
         QBOFuh3Er8IF7Ud0cd5Xph7UWZWsfPQR5uHHwn5n0I3Yc0at8BiFSTRkaaC4oufeami/
         5VT7CdnmzoYGC85b5eY4nGaPTbdnq/ly8bzjtQJQz4A5cxqfFEueUWK9t39IyI6VgB57
         vs+NUn8s7BKAKtSom9Kxi3C8wAdXSgJEu4I09ncRbzTdHG0lWlPK1o5iTjjwEV/764Ja
         RzMgmb4UMNgQF6Phj26OB1pum/i0O66B04Qdx+Y9Cx8bXB5LrJM5c3+a29wVh+J11wlo
         c4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YlBtLMwXDp/2aSzEQXf/0+zL7sSyqtfpT0RHI0yBN90=;
        b=mypQfYfveDfhesANQhD7RNtLJNgMozQqU4kg82OdEICrkvTkL6cUrbDRe4jF1TXEot
         M+8vNEIEq5hyt/nlncATnnnJ8O3i4eaDAN+UO84m3rTsOZ1pAZKzlqdxt4nZNoIspy8b
         vFDqG2MTh7GMWMzCKHqdumyO3ZcxPasRd1XvvLzh09fQkXijahk69w7KPN7dnVjNKHy+
         2P6/FUkhlldteai50L8RvUUZ4hz6CUeEbm1SrvdvR/jsdHPkemFHiQ/Wp1SFh9OFDD9L
         U5spXVnV0ShJr5cAh886Qh7ik0tivO5TRkUJ5kifb3ySh4sgzyRDhmFQxkoHIiSSJ8lO
         KYwA==
X-Gm-Message-State: AOAM533cTlIyWiOO1y8308F+EaTTrTtFxTPujgySHUE3Wq5rm5aTwfFc
	GmIYF6Fu8jHj5wksHm5IpGClit8qIMKH4t3+tNTIRA==
X-Google-Smtp-Source: ABdhPJzV+fEMQ3b/d/a51/OGIg4GPl4a5ZojCGV9lwpP+gO59cT8hdkP5KKDh0yB0UMK8Iu+Tweu2xuIv/PiG9bs28M=
X-Received: by 2002:a17:906:4785:b0:6df:6784:a7f8 with SMTP id
 cw5-20020a170906478500b006df6784a7f8mr9035751ejc.301.1649030673654; Sun, 03
 Apr 2022 17:04:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220227144926.3006585-1-jernej.skrabec@gmail.com>
 <20220227144926.3006585-3-jernej.skrabec@gmail.com> <1b2ce01fb04f29cca58d40bd81d9f4cc46dcebf8.camel@ndufresne.ca>
In-Reply-To: <1b2ce01fb04f29cca58d40bd81d9f4cc46dcebf8.camel@ndufresne.ca>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 3 Apr 2022 21:04:22 -0300
Message-ID: <CAAEAJfCA1ef5+KZHU4ZTJvuqdCAEUkvpDY9HTy1fp3M+0QxqPg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/8] media: Add P010 format
To: Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Greg KH <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, linux-media <linux-media@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas, Benjamin,

On Mon, Feb 28, 2022 at 9:48 AM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Le dimanche 27 f=C3=A9vrier 2022 =C3=A0 15:49 +0100, Jernej Skrabec a =C3=
=A9crit :
> > Add P010 format, which is commonly used for 10-bit videos.
>
> There is a much more complete patch that was sent previously (with docume=
ntation
> and all):
>
> https://patchwork.kernel.org/project/linux-rockchip/patch/20210618131526.=
566762-5-benjamin.gaignard@collabora.com/
>

I believe "media: Add P010 video format" should be good to go, I think
we could merge it.

I can't find it on my gmail inbox, for some reason.. can you guys
please repost it,
and/or reply to with a gently ping for Hans (and please Cc me on this mail)=
 ?

Thanks!
Ezequiel
