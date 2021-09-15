Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71272FAF
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Sep 2021 18:24:35 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id y16so7616647ybm.3
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Sep 2021 11:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7RXqX/hUdFdwQUb5z/V0o6CoEwawljEuDEudecxTGDY=;
        b=ZMDeOwtekHdMrtBPE/VQHx5SwkBrzSk1OdQ5bN+BlC7s/ZSyHRcBMOHbK/wE6Ip6V6
         vhpSwfNpQRXOZyScjmxgmoXJ3m1QeZeDGC8nJt9inBbP+PrgCQfsR8QSvBKBtu0TRLH1
         MV3va7MYLaMpp2ftzqQEGsJi9GZ7AznWHse1JdrQhs+18UqRJsqAnVRNy8kEqzy0z4Xa
         3aZzr797snke5E67SrYaJnuHZC7Fxy9SefjRsRutQKVGQdljPgQ29UssGRdZzOEPM9HN
         He9ncks3epHadcEQg+mRgcxL3FhjQ8nI34xUOFuf3qat1ywsWRMX+DBONz/xkpeY6hL9
         mGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7RXqX/hUdFdwQUb5z/V0o6CoEwawljEuDEudecxTGDY=;
        b=ryFcnwa+ALKLOL6H4fqC6xoHa+WuwxWvR3vDW6qkgZm4Jvc+eL3bEKdLjBSeHFmiMx
         Y83yTQ0R+3jM6mv+tJ2eYVJ1EKsYV/jxf6nX/yvxVIf0CTqVuIXdf4KSKwqCSvHMeeZd
         RXxpioC5ReMSFVwKhv+FFG80fupB57eGGWfXnVccneq4PdYQ3dlPowF7muJpVi0uP4H0
         oBeDGarZ61+Ra3BOQk80McDP6sJ2KSIGrCTEqVAei2rKMbTOiZM9G+LYI504HonYCTXB
         Rwanoxan4F+t98AdCp68JpSzvNIjL++/MJ0hMfY/vkQNkgGKdu1KftiLsIbBz079VNBc
         o8jg==
X-Gm-Message-State: AOAM532WQ+m6RoXkAQ39+Q9SOmbpD2eLyYLGXCdaFJ7ALlTPJEJ3+Mfy
	uIQRG+ksXKJZdstgFB/Ax+g+33HP+k6C0gGdUcaVKg==
X-Google-Smtp-Source: ABdhPJzh5PJPPYOA16dLkLWvEXdxrB4uE+FUnf7Y0P5BFRVY2hYt/pF9w5j33m2DoS1+jsa6jw4xqvkGKFHZCs3FaCU=
X-Received: by 2002:a25:4f8a:: with SMTP id d132mr1634181ybb.486.1631730274416;
 Wed, 15 Sep 2021 11:24:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5570111.f9yF5Hohu3@kista>
In-Reply-To: <5570111.f9yF5Hohu3@kista>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 15 Sep 2021 11:23:58 -0700
Message-ID: <CAGETcx9_dy4qdmZ-+X+WLsezPKWfZzmRU8QmhKOu6FdZcysWDA@mail.gmail.com>
Subject: Re: Issue with fw_devlink=on on 5.14
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 15, 2021 at 11:07 AM Jernej =C5=A0krabec
<jernej.skrabec@gmail.com> wrote:
>
> Hi Saravana!
>
> I noticed that in kernel 5.14, at least on Allwinner H3, deinterlace driv=
er
> doesn't load anymore if fw_devlink is set to on. If I set it to off, driv=
er
> loads and works without problems. If I remove interconnects property in D=
T
> node and use driver hack instead, it also loads and work ok.
>
> For reference, I speak about this node:
> https://elixir.bootlin.com/linux/v5.14/source/arch/arm/boot/dts/sun8i-h3.=
dtsi#L153
>
> Do you have any clue why it doesn't work?

Kinda busy today and I'll take a close look later, but if you delete
"interconnect" but it works, then it seems like you have no driver for
your "mbus" interconnect? Is that expected?

If you have a driver, then make it use the proper driver model (probe
a platform device).

If you don't have a driver for it, I'm assuming you have
CONFIG_MODULES enabled. Otherwise, fw_devlink=3Don is smart enough to
know not to block on devices that'll never be probed.

If you do need CONFIG_MODULES enabled, then use
deferred_probe_timeout=3Dxxx so that fw_devlink doesn't wait for more
modules to be loaded past xxx seconds.

Also I like to look up emails on lore, so when emailing me about
fw_devlink (or any Linux stuff in general I suppose), it'd be nice if
you can cc LKML.

Thanks,
Saravana
