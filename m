Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9930334E774
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Sep 2026 03:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404902; cv=pass; b=uLKlxspK09neDn+LNjgHqmP9BFRgN0wEpUSPZRELv71IpfcWyiinhGRIyJzIrvnHSQjc2269f0JM7cL3SvrHQxkyjaa4XTTUysagIAQ2DbZyrax9oFKkK1wlcISBYwJh0zQF6ijX5PAVgfyyGAfephQo887PI54rWJWoefbiiCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404902; c=relaxed/simple;
	bh=ZQN9NJXDj89uzGf2iFwIqxTSP9mMueIpc4XZFDO0eY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jxKBUM4pDuiZmRC4xbZgJ+sxjraiyHEw2tSgc6nzaT/7cLkqvHa4i+WPtJcYENsUvODGI4Sd9GtdJmAkVe+ElLs8+K1qgB+JJHaN2wt7t3XG3/2dewTkjTCuhnPjBHWAB6Or38YJCT+jodm1pZCmtGVI4F0R2KzMp9vnGE4HizU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rkn2Bcsu; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rkn2Bcsu"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66c744a00edso1778273d50.2
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 20:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788404899; cv=none;
        d=google.com; s=arc-20260327;
        b=gxgo9h3C5naTo3TiGMsc+yhwrD41OvlqrO3sgbAJn9k6uuaPqZsBTptUuMP0biyyeM
         85TfzhP9XJx5KOwHG38lVD/YU7j4/i6TfHs0V2CwGQXEek+I6dMAR4C/NoYlvYEzfCDb
         +dZmd5lxsBLdM1P2PHq6gYEpUVeZxqNOW+8z+wDuLr7H1eBzj/kMZozXggspVxk3b9i1
         IC+TDgf1yAkeDi9DVa6eazcIgOwej+e8q0sKIaa2BxbIlmF1eB3lDyhfb9Rs1AdJUu9S
         YhtQRooAGoEsuxzkyYRp0rgv+Ziz5kQTsApLd14Ha0d/mKxSrWMZxHvBG4RkNl62oElb
         O9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        fh=k0xy9q9ll1rOfJn+SnNw7QnRkw/fcsjkWiVYWVGu8EQ=;
        b=PLMuz9Chja6nKk4xvC3E0UNNx7sGZPJK/HVTXyDwCG91zKGPgLqQtiZu7NQJrY317A
         cSSnEcyMgkYenZrjcS556GD9u9QmN3YMPCaiul2Jji5BK1LxWlxcGGJPchjnvmOvQe6v
         9sS5FrTMri4vxjnejCJFAQ3J4OXrL9Ze3BpCCg0w9tSZ5wn01mjKK573LPbwk0ZNz5Gw
         Bd/tX3zze3HATjJ7L/KXoSzmXSVYvRfuG6gb70Gzo8FXnYy7EwpRAu82isjDTJpbRHn4
         HYwouwF0NcyLgBsOgUj2LvYap9C8OcGXigwThbYm4tu7IlOtHfySZEbpUudf9CKOS8g3
         G0gw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788404899; x=1789009699; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        b=Rkn2Bcsu+M2HxWOwIZu9FA6yOgYornAU/b9ncyaLPxC4ExKIcThMUxjChxBhaUCWLb
         QtG3hfychTGq4udF/JeU0QQara9bb2GpfOVvV3erpZEKg/jGOXzY0NRnYa2ZlSJKGdaY
         bzCgqG6SohnAar6sAVGECkZgeoUUPvllT+6zU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404899; x=1789009699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        b=IMsd6QbiJ387M6bxlucZoRIvG5bCG+G+RpI6CaM5P5Oj6V3v0tHzdvwyuzX2OZFNZT
         uc4NlVXN8GcpydI+h51r5x2r7vuX6Z85Zept4kxg2YygxQ8LWtEQADtY5Se7oCPL1eFZ
         C2O/RWLE5JS9GK60P9tZWFxCLFYj0KNJ2lNA1JvdIsTEf2ZV4YZeCo1pqNZSFxZzpH3o
         aaJ1/Xif3HYRERhNpiDXtoAsQyO5LEbkTNO6mw7+QymhFrCk3bbD1GC36KN/Nnyk7rA+
         2RH2vWkJbV2sWrnwWRWavgaI1tP+C27LRKw/gTWvIpXdxyLQwnTY1MWjiAmKFjMrQNDy
         Mgdg==
X-Forwarded-Encrypted: i=1; AKwUvBxkbrtFDe8ENMj8JgnlKnzQ9EXJCiWOkV7kSyjy3YqrMl+FiEv+xOCGlkgca0KKD+x5dkdraSk++PAhbA==@lists.linux.dev
X-Gm-Message-State: AFuF++nlkuXkmaY9MK43NGaGbA4O/AuOj17AT68dfDVCWsm+YFLsWFU6
	r/ZXEgC/1Hkad9zIZmF9QGTKMONjV8wU1Lkp+EC6QZ6U1K0+L1UyJC63qKQUpY5t2rAKaiCaKP8
	/DP6yPuv3e+irNFv2v9Ut6/+drzUgQWAqkwcfBfty
X-Gm-Gg: AYBFou3VQ1gtfKg8r77rjZgUq6fjF1Zxu5xxIQbx8/kMnXASjVmKrXCE5FhKMY9Ucpk
	11HA27lNSGZEIKzucmqXSRKPutBywyivRFPne/mvbVfmBbNJ7lEPljrZmY1GAAL4/iAfIFPyWUC
	ucoM7TCCI3Fq/JCUuqCB+AUgV1L44emrgv+BivRi66f8vvQCIac+++MxI0ISuMT1VMzVvc78gBt
	jjcc6LwnPomSsjvoCDpxK8VzjpfIjOIwk+JZlSkQl54+LkoZs6wqHEeblJsst6JvmN5yr+3nlgl
	KVArviyjT1Qk3wSbcFxzcXipZuejjv3rglLOJdzhHK3ODSFkX2uWrF+tCLIgXa8RShww7fwslnM
	=
X-Received: by 2002:a05:690e:400f:b0:66d:113a:3928 with SMTP id
 956f58d0204a3-66f9bb6f3famr3574226d50.12.1788404894746; Wed, 02 Sep 2026
 20:08:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com> <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 3 Sep 2026 11:08:02 +0800
X-Gm-Features: AcwNN1Wn32BWTc7gvrI5NCynGubfvPlrWgUmvLkoMfGnpAB8yTnTJoIOOvbhgBM
Message-ID: <CAGXv+5E9zs7LsK=d08NB6QcuHkaPw4GcifuDuMDz0CVB6gB=8A@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
	Houlong Wei <houlong.wei@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joseph Liu <kwliu@nuvoton.com>, 
	Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 4:08=E2=80=AFAM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:
>
> Use the devres-managed devm_of_reserved_mem_device_init() instead of
> the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
> pair, letting the device resource manager handle cleanup automatically.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/mediatek/vpu/mtk_vpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.c
> index 8d8319f0cd22..557bffb2c2f1 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> @@ -888,7 +888,7 @@ static int mtk_vpu_probe(struct platform_device *pdev=
)
>         dev_info(dev, "4GB mode %u\n", vpu->enable_4GB);
>
>         if (vpu->enable_4GB) {
> -               ret =3D of_reserved_mem_device_init(dev);
> +               ret =3D devm_of_reserved_mem_device_init(dev);

There are non-devm calls before this. Inserting a devm call in here
messes up the unwind order and leads to confusion. In other words
this is a bad idea.


OOTH, the remove function is missing a release call.

>                 if (ret)
>                         dev_info(dev, "init reserved memory failed\n");
>                         /* continue to use dynamic allocation if failed *=
/
> @@ -930,7 +930,6 @@ static int mtk_vpu_probe(struct platform_device *pdev=
)
>  free_d_mem:
>         vpu_free_ext_mem(vpu, D_FW);
>  remove_debugfs:
> -       of_reserved_mem_device_release(dev);
>  #ifdef CONFIG_DEBUG_FS
>         debugfs_remove(vpu_debugfs);
>  #endif
> --
> 2.55.0
>
>
