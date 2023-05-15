Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578BAC2F7
	for <linux-sunxi@lists.linux.dev>; Mon, 15 May 2023 12:18:55 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-759219bed84so173498885a.0
        for <linux-sunxi@lists.linux.dev>; Mon, 15 May 2023 05:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684153134; x=1686745134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPBAfbPStH09i45L5DnPnuQOFxW4JGqFBQ2GbD9peU0=;
        b=YH+Shd9jg7YumKA78gdtc+aSlzrP79SxdxGoi2LxreTrbGsx/a/9bApYKhuXR+yf7f
         XiQ/Fy9cZrz0ATTUwALDiF/5J1lVM/XHRpp2SiENfyuOOL3Ha18qWpUYxAmtgr/Q7sEe
         tPhuIcKq9O8tR7SWlIH6Pul8dhc/jTz92trOtsxYKRhP2JnY19qlWuy1jBCeyX7rqI8x
         PG9JpXN47/jIdsDf+pPHVeFzwDW1lYFZh/dYSVr/HPlBx7lVR0PUEwPIgTxem1sEXy9a
         hlxOa2ESZMoOtOP5//8pWG3pqTlKm8h6kCx8rq30evHaqLnZ1LQqfG2grBAEo3kygvxy
         veNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684153134; x=1686745134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPBAfbPStH09i45L5DnPnuQOFxW4JGqFBQ2GbD9peU0=;
        b=DFqMxOE1wq2UDrt9rLNa7MxCmTDZC3HXRm8dHw0+Yufi9MvRDpaF9vVs8GpSkf+zKs
         7iMD3u0ShbfD7ZtN03Vc3YeBoeSdeq0KjHmIhSG7fsB9GwGFi4Xs55/EqGXTTuRrVww1
         QtScnP/zrTLXQWgyfSRNfhaAPky19LFIvBTpy8vwGUPauUhfcl2eDz73YHMsjFB59fUM
         uOXh8rAJgoc7vyoxeHvT8T4dH1f0QVOOzXRHvXm9MSMngevzhv674TcV8nAW6cw72LYk
         JrQvcG7o227LLBqKZzOPr6IgDUccNvMafwTc9dIvOjHgnY02I70HNj3CyUJZZzqe8E5g
         5Y4A==
X-Gm-Message-State: AC+VfDwIe47lYIrRviIl+dR0ZfInfFRmJm0Lo5fOVlI7bwhLA4dRprQK
	stZ0uEV2aUZnZrhjoJdpJhCv0pdnUQLzC6qSbt7fopVs
X-Google-Smtp-Source: ACHHUZ6eoA3YojvSjRse/6Kk9bcYV9jJG2dg27vEDStirnLusMJfoLNOeTkOgzeEiSLm+RnbtBBGo/ZICdul8c7IkEw=
X-Received: by 2002:ad4:596d:0:b0:623:690c:3cd7 with SMTP id
 eq13-20020ad4596d000000b00623690c3cd7mr2116171qvb.47.1684153134129; Mon, 15
 May 2023 05:18:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230514200345.502807-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20230514200345.502807-1-martin.blumenstingl@googlemail.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Mon, 15 May 2023 22:18:41 +1000
Message-ID: <CAGRGNgUhUZ8X+XOQ9xDEWzwih1zbedQr=1ztxexs3djeaBWzqg@mail.gmail.com>
Subject: Re: [PATCH wireless v1] wifi: rtw88: sdio: Always use two consecutive
 bytes for word operations
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	pkshih@realtek.com, tony0620emma@gmail.com, kvalo@kernel.org, 
	Larry Finger <Larry.Finger@lwfinger.net>, Rudi Heitbaum <rudi@heitbaum.com>, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Martin,

On Mon, May 15, 2023 at 6:12=E2=80=AFAM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> The Allwinner sunxi-mmc controller cannot handle word (16 bit)
> transfers. So and sdio_{read,write}w fails with messages like the
> following example using an RTL8822BS (but the same problems were also
> observed with RTL8822CS and RTL8723DS chips):
>   rtw_8822bs mmc1:0001:1: Firmware version 27.2.0, H2C version 13
>   sunxi-mmc 4021000.mmc: unaligned scatterlist: os f80 length 2
>   sunxi-mmc 4021000.mmc: map DMA failed
>   rtw_8822bs mmc1:0001:1: sdio read16 failed (0x10230): -22
>
> Use two consecutive single byte accesses for word operations instead. It
> turns out that upon closer inspection this is also what the vendor
> driver does, even though it does have support for sdio_{read,write}w. So
> we can conclude that the rtw88 chips do support word access but only on
> SDIO controllers that also support it. Since there's no way to detect if
> the controller supports word access or not the rtw88 sdio driver
> switches to the easiest approach: avoiding word access.
>
> Reported-by: Larry Finger <Larry.Finger@lwfinger.net>
> Closes: https://lore.kernel.org/linux-wireless/527585e5-9cdd-66ed-c3af-6d=
a162f4b720@lwfinger.net/
> Reported-by: Rudi Heitbaum <rudi@heitbaum.com>
> Fixes: 65371a3f14e7 ("wifi: rtw88: sdio: Add HCI implementation for SDIO =
based chipsets")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

The linux-sunxi folks might have comments, so I've added them to CC.

> ---
>  drivers/net/wireless/realtek/rtw88/sdio.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/net/wireless/realtek/rtw88/sdio.c b/drivers/net/wire=
less/realtek/rtw88/sdio.c
> index af0459a79899..06fce7c3adda 100644
> --- a/drivers/net/wireless/realtek/rtw88/sdio.c
> +++ b/drivers/net/wireless/realtek/rtw88/sdio.c
> @@ -87,11 +87,6 @@ static void rtw_sdio_writew(struct rtw_dev *rtwdev, u1=
6 val, u32 addr,
>         u8 buf[2];
>         int i;
>
> -       if (rtw_sdio_use_memcpy_io(rtwdev, addr, 2)) {
> -               sdio_writew(rtwsdio->sdio_func, val, addr, err_ret);
> -               return;
> -       }
> -
>         *(__le16 *)buf =3D cpu_to_le16(val);
>
>         for (i =3D 0; i < 2; i++) {
> @@ -125,9 +120,6 @@ static u16 rtw_sdio_readw(struct rtw_dev *rtwdev, u32=
 addr, int *err_ret)
>         u8 buf[2];
>         int i;
>
> -       if (rtw_sdio_use_memcpy_io(rtwdev, addr, 2))
> -               return sdio_readw(rtwsdio->sdio_func, addr, err_ret);
> -
>         for (i =3D 0; i < 2; i++) {
>                 buf[i] =3D sdio_readb(rtwsdio->sdio_func, addr + i, err_r=
et);
>                 if (*err_ret)
> --
> 2.40.1
>

Thanks,

--
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
