Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA99168
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Jun 2021 18:32:01 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso13230545otu.10
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Jun 2021 11:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=74AxLvmVaiaJbdMU5QTfz31h53EKJxg76jxp0ED+OLQ=;
        b=kIQQxIhVgra4Fa0ExLlQR09NQAO7hFwkkMXIVMwX78hRrw0rkWvUZCI7hAENR3vQWL
         4yVimwAINItbaFXc1qjtnJpjtXY++dDegpz4O9FUuqM8LkwzbqvQAHlgmwWhacydBLVm
         6AG4YCYMlC1fyVZIHWbdfmaV7ygNxMT5C9mWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=74AxLvmVaiaJbdMU5QTfz31h53EKJxg76jxp0ED+OLQ=;
        b=B/e1YxvqbgIkt1hTIi4w/DZ1KDjLPGA/eKw7nmGYjX3MB3u26NJ6E+hjUjY1qfd6dg
         31KdV22dp7Hc8w3346w5ym4kowuJBoh4kjvTUluhEJ397Di1RRrmoVJP4EEj6/Go6FCk
         +LhI0HqM9+psx1dcH2tW4lM1QX0xYBHZ8wxxjDDw19LS/KVGruppSMs8lUx6cQzFeK/s
         FP1j69L4b5K9kk+TXd6sds/o/HcXNdAYwuJSBPUMO+h2pX7rPZfvEauRbrfIS6zu6eQ/
         Q6HnbPa9/VRPXUMMqeZNDD5t9SpCZTW1rxG/wZY8rEhDLh1jZCjrdyMs2lnrPslhBO/G
         RZGw==
X-Gm-Message-State: AOAM532h+aAzV6atPx3SwIw3btEMJUXcw1q6T4PAOAEr8ueW3h1LN4wY
	X/5m/hZtLBsn0xKPmRZwQwS4X5XyMsZHqPPC781+kQ==
X-Google-Smtp-Source: ABdhPJw1/HLtEv+9aIWikdDn6a9JB6LAovJdXi6JHtDuUMBLl8b03kTqlBbg01DCuud34Cfo/v304vlRPb66IecAw5w=
X-Received: by 2002:a9d:74d4:: with SMTP id a20mr14753079otl.28.1624732320237;
 Sat, 26 Jun 2021 11:32:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210617184621.4083311-1-icenowy@aosc.io> <20210617184621.4083311-2-icenowy@aosc.io>
In-Reply-To: <20210617184621.4083311-2-icenowy@aosc.io>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 26 Jun 2021 12:31:48 -0600
Message-ID: <CAPnjgZ3FzF714HWWw2Ay8b5HnPPx82cf8piAVc3pU7eFe=LH=A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] mkimage: add a flag to describe whether -A is specified
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Andre Przywara <andre.przywara@arm.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Samuel Holland <samuel@sholland.org>, U-Boot Mailing List <u-boot@lists.denx.de>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Icenowy,

On Thu, 17 Jun 2021 at 12:47, Icenowy Zheng <icenowy@aosc.io> wrote:
>
> The sunxi_egon type used to take no -A argument (because we assume sunxi
> targets are all ARM). However, as Allwinner D1 appears as the first
> RISC-V sunxi target, we need to support -A; in addition, as external
> projects rely on U-Boot mkimage to generate sunxi eGON.BT0 header, we
> need to keep compatibility with command line without -A.
>
> As the default value of arch in mkimage is not proper (IH_ARCH_PPC
> instead of IH_ARCH_INVALID), to keep more compatibility, add an Aflag
> field to image parameters to describe whether an architecture is
> explicitly specified.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  tools/imagetool.h | 1 +
>  tools/mkimage.c   | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/tools/imagetool.h b/tools/imagetool.h
> index e229a34ffc..5dc28312c2 100644
> --- a/tools/imagetool.h
> +++ b/tools/imagetool.h
> @@ -51,6 +51,7 @@ struct image_tool_params {
>         int pflag;
>         int vflag;
>         int xflag;
> +       int Aflag;

aflag

>         int skipcpy;
>         int os;
>         int arch;
> diff --git a/tools/mkimage.c b/tools/mkimage.c
> index cc7b242faf..54d8e3835a 100644
> --- a/tools/mkimage.c
> +++ b/tools/mkimage.c
> @@ -168,6 +168,7 @@ static void process_args(int argc, char **argv)
>                                 show_valid_options(IH_ARCH);
>                                 usage("Invalid architecture");
>                         }
> +                       params.Aflag = 1;
>                         break;
>                 case 'b':
>                         if (add_content(IH_TYPE_FLATDT, optarg)) {
> --
> 2.30.2

Regards,
Simon
