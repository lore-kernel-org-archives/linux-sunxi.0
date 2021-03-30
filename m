Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C430D70
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Mar 2021 13:28:37 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id e14so24785823ejz.11
        for <linux-sunxi@lists.linux.dev>; Tue, 30 Mar 2021 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8RThsbf9BhqWQhQcC13lueVfCtL3RqgvJoYxUwSarqs=;
        b=KhnWWX3tN9hrBFHwhWTPQ2hiKD476hhcZYurygt5Xi6g10ko6fBCySNTJPG3+IqW05
         lqJcki3fYqKu9rsopAJQq4USS4ZiyLEkJNskuIJEWy+hnl0Wx2Qqlj5G6nL8Th1iqRNd
         Axy8A2EVf66d9J45q5yTdS9NEhuo/SOC44s4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8RThsbf9BhqWQhQcC13lueVfCtL3RqgvJoYxUwSarqs=;
        b=YT23D0HROpI/+xbZjoZJ3SO8D1yXo8mVgU/zsqxd7SjfL/mmzhAO+EJtESTvkI6R7c
         4GhreYYKq3oKXg0711B6vTrR+gnOhfqPegl+EqkzU/bQZWd3wwrzyERvQZKg8+hQRn4i
         19ZkT/Ba+j20RqTFyqshRyK08I8oiQRTG9xTjaMc/RLgk5LWEWnl6jV+zBdn5paMm5Ln
         KOwis4hsUTDpqZsMMSVdrRGiThh+K/G64J8SQ/kFvUTqPJOhXftjn29vSINI0myTi5hD
         0BMyZMzdo8Zd7ixee7uNamZH8pw+z+mNF8shGN8CuCZmfJx6StoreMnxck4D1TJ6ijE5
         kjfw==
X-Gm-Message-State: AOAM531imhXsTR5MECFCAisdeRm0e8l4F6lic4orTx7O/j8+crKkKGcX
	6pUahbgZtaQtPlnGGI8m3k9Zita4O5xw+cTdL9lX1w==
X-Google-Smtp-Source: ABdhPJwxAX2Zl1SHDx7KgdnVCSaV13YZoQ76uLaz2v4y6j5UGMjID32psiI4acFPSmaqmvfIPjGqEVPffIMA55Wjwf0=
X-Received: by 2002:a17:906:2bc3:: with SMTP id n3mr33587032ejg.418.1617110915899;
 Tue, 30 Mar 2021 06:28:35 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210330130122.3915-1-andre.przywara@arm.com> <20210330130122.3915-3-andre.przywara@arm.com>
In-Reply-To: <20210330130122.3915-3-andre.przywara@arm.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 30 Mar 2021 18:58:23 +0530
Message-ID: <CAMty3ZDpETzmE=1CRo2d3yT4FN0nSi7p+pvf8cLjBSwfu7Kpkg@mail.gmail.com>
Subject: Re: [PATCH 2/2] sunxi: dts: H616: Drop reserved-memory node
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Samuel Holland <samuel@sholland.org>, 
	Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>, 
	U-Boot-Denx <u-boot@lists.denx.de>, linux-sunxi <linux-sunxi@googlegroups.com>, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 30, 2021 at 6:31 PM Andre Przywara <andre.przywara@arm.com> wrote:
>
> Trusted Firmware now adds the /reserved-memory subnode to the DT at
> runtime[1], putting in the right values.
>
> Drop our hard-coded version, as this might clash with the actual values
> (which have also changed), and rely on TF-A to add the node.
>
> [1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/7770
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/dts/sun50i-h616.dtsi | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/arch/arm/dts/sun50i-h616.dtsi b/arch/arm/dts/sun50i-h616.dtsi
> index 953e8fac20f..dd4d2f31111 100644
> --- a/arch/arm/dts/sun50i-h616.dtsi
> +++ b/arch/arm/dts/sun50i-h616.dtsi
> @@ -51,18 +51,6 @@
>                 };
>         };
>
> -       reserved-memory {
> -               #address-cells = <2>;
> -               #size-cells = <2>;
> -               ranges;
> -
> -               /* 512KiB reserved for ARM Trusted Firmware (BL31) */
> -               secmon_reserved: secmon@40000000 {
> -                       reg = <0x0 0x40000000 0x0 0x80000>;
> -                       no-map;
> -               };
> -       };
> -

As said always. it's better to not touch Linux dts files. If the same
fix same available in Linux add SHA1 on the commit message otherwise
keep /delete-node on -u-boot.dtsi. This how we are maintaining sofar
at least on sunxi.

Jagan.
