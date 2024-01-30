Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174B737152
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Jan 2024 03:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706583606; cv=none; b=pUNn3StF3lOUg3oeNsea0d5N7kEz0CbHwmHeDvbJxRmd0xzIibm/5Iw3IXp1MvnCP7L28atE9/fLldmq7HQh8OuLEo3xLeBDjemC1YvqZChxrB8vk44fA7xohUWV45wjo7Q/4F9HUnZrZnTvKYlJ+Nnzexv7vH9AF7bqU5HGQxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706583606; c=relaxed/simple;
	bh=9AinedqN5a23j8ZNdRuRz3oB1vBeWeHq7pPCHPeFpYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTFrCIN77TcVdQsdv5uTgGmq3KzeT7ythIfruZ6i0/Huj9TLlDW9QmOt4J3c3h1UAv7yYnkbUEULYXTehNx33b9eGg/DWXFuutHrPFRUMOTsAzzKkyF0+IBtcOsST1xY3KF6HhqEoteGBB3QvJLw+xxD7EKS4m5zS1xtUdN3UJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+g1JMwF; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+g1JMwF"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-db3a09e96daso3044724276.3
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Jan 2024 19:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706583604; x=1707188404; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9AinedqN5a23j8ZNdRuRz3oB1vBeWeHq7pPCHPeFpYI=;
        b=T+g1JMwFlKTk+anuM2jH5oNzk3PtHrO/CMJzGvP/ZNd0KsiuIfjkY/sZT6O7gP6Dlg
         Ept49HXPoWkhCughkEvvBwDVHPz5Zck1APb5QTZ7jiSi/YB1CIpK99wgUqOwC2g0BPcN
         dArdkGpCn71FM8DDk1+ajGDLOi6SHOkhS+9DNoh9exW3GN9tD9hUeU8VqxJ1S5VgSv2y
         GuCubCR3jOlHBRphd7A1DbeWS00DI7X4XVird16Wk406DzE51iYY0nqN0rFY5YL94zKN
         6vnpa614QY8aWM0F5fceFrSVZMwTALWZ3t+J3upHFC1IbBArckfxVjbo29uSTSN5fodn
         95jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706583604; x=1707188404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9AinedqN5a23j8ZNdRuRz3oB1vBeWeHq7pPCHPeFpYI=;
        b=rq/+rGcQnJOhXtEHeLKScg2M0N83cfS5O5LnDlUuO7Q+YS/64fxGlde1EsZfDSkVJo
         1E85sv8YU0TYzueUF0Bw19bslT9SfwDyl25S7y+tDzJ4GDfVWBrPztnUWNr0v8pMdwda
         zvvK5GMYPHB3m0tZyuKR3ksTV2cIj/iars90WVN6X3W7jhBHanSrDbli15F5jI4QQFDH
         m+Ifbrvq9PR5wj8Ry0WAaqxfKREcDA6VMOtJjyYH1ASczghcdbSTiZY4WKvS0QmFOICE
         TMsfor/gJVXHbZjAFV8cXQsb2cvUgLgUBuG7IXSPAGJMbhCGX3xySc8cSfcSOIasKyzo
         T2yQ==
X-Gm-Message-State: AOJu0YxsRjGyORENC87IJ5RFz77DTD6oYuIHrWpRj4QY3FiacLnWdBaJ
	XlWI7YeAnXj52fE7ORc8EKSOC0Pw5K6Jxrx7zdE83i9UsVku5VpGc0LpfPeflFqi5bwN/5oFfyD
	vVhF5aZEhtexZsDFuVAmj1O2x3vvZb8+3
X-Google-Smtp-Source: AGHT+IGGbkcyqEhUK6J+QjJKin3B2BB5a3FyF8ieekc1Tt5hc6phHe/Zn3a53JXvgVFC2vZvrdVAfa5Vahkn0ASZ35A=
X-Received: by 2002:a25:eb0a:0:b0:dc2:5436:7acd with SMTP id
 d10-20020a25eb0a000000b00dc254367acdmr3450207ybs.42.1706583603875; Mon, 29
 Jan 2024 19:00:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231228052915.121433-1-gch981213@gmail.com> <20240121011528.3fb06011@minigeek.lan>
 <20240129165555.63ddd462@donnerap.manchester.arm.com>
In-Reply-To: <20240129165555.63ddd462@donnerap.manchester.arm.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Tue, 30 Jan 2024 10:59:52 +0800
Message-ID: <CAJsYDVLTW7PvUF8Gc+8YL+xgrrZmCNJpQM-dMriF3=r2sajU_w@mail.gmail.com>
Subject: Re: [PATCH] sunxi: add defconfig for nanopi_duo2
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, 
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Tue, Jan 30, 2024 at 12:56=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> > Judging by the DT, this board has USB-OTG wired up correctly, so we
> > should enable it, by adding:
> > CONFIG_USB_MUSB_GADGET=3Dy
> > This would allow access to USB Ethernet, fastboot or UMS devices, which
> > prove to be quite useful for U-Boot.
>
> So I merged this patch, after adding the USB_MUSB_GADGET option.
> I just see that the CI complained about a missing maintainer entry, I wil=
l
> fix this up in a follow-up patch.

Oops. I forgot to follow up your previous email.

This board does have a working USB OTG port.
Thanks for fixing the patch for me!

--=20
Regards,
Chuanhong Guo
