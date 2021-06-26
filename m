Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEDE168
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Jun 2021 18:32:04 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso13230648otu.10
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Jun 2021 11:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gQZiZVg9ozqLL04eEwQiQJBxyvYlBF3KVvFJv6VXsrY=;
        b=LfwFO1cIs9wB/gAc1/9C+hNIQE8sPV5mPtnge05FsJovBRefR2wlqNVCY4eZX639UN
         z2wPzJx4jtghRfCbjB857oTvyOE/q7hSd8GVjWgfZX3IzOBLFlOgb/e5HlOBx4xfot18
         GcJTu+sKLRDd+rdwUpHyAur8uF/Za0+AVuUuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gQZiZVg9ozqLL04eEwQiQJBxyvYlBF3KVvFJv6VXsrY=;
        b=mC9KxmgL8VSRxG6mjgCJ4X6cLk+g28Crr5JhCvJFT9+XUovM2fwlGlthOdlltCJBeu
         JpMMC3izKMuEvWe9X2Zdb/sOy/Hsw/9+u0WJ1YiSw5vrN42xMtnxoXaC3w4EVK9+9njC
         a2hT/0dPJ7hcT0J6cxJLSBcfKsvhc3LKAqeQvHSZw2SBO2qExz3wHQzyIxjFfDOGA17i
         oPT+sDJOBmdwlZSjLuiTZZeO/TIDYq2ci1j2nAROt2b3XGz4Q4U5gJeSManOJebOB+1J
         s42n8jHhJTZXtKCVvA12/hMgB+dREaPeMACJbMb6KEZ797kNqnDF/upfSltt8KsP27FS
         qdrQ==
X-Gm-Message-State: AOAM530sAjTOVYSblDAAKx+R8E8NwQ975H1jkkIq1JsJeu5i1RYawAsq
	ZFBaIS+E7bo2in5WYV0k5Jfix4IIINWegHRwNqDN4A==
X-Google-Smtp-Source: ABdhPJzgktMQUY+st+217v9ZgGGzooHut9YBLfyEjm6gKgyJcb3vVouhJTE9GLqjtGuFGUOtMIdmkXeQ2fDKMLIHJxg=
X-Received: by 2002:a9d:2dc2:: with SMTP id g60mr14878325otb.54.1624732323238;
 Sat, 26 Jun 2021 11:32:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210619091838.646779-1-icenowy@aosc.io> <20210619091838.646779-2-icenowy@aosc.io>
In-Reply-To: <20210619091838.646779-2-icenowy@aosc.io>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 26 Jun 2021 12:31:50 -0600
Message-ID: <CAPnjgZ3-iAng7Y9d+cjZY95vOeKfJStbVbQWYiUZURhptxZrmQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mkimage: add a flag to describe whether -A is specified
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Andre Przywara <andre.przywara@arm.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Samuel Holland <samuel@sholland.org>, Tom Rini <trini@konsulko.com>, 
	U-Boot Mailing List <u-boot@lists.denx.de>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Icenowy,

On Sat, 19 Jun 2021 at 03:19, Icenowy Zheng <icenowy@aosc.io> wrote:
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
> Reviewed-by: Tom Rini <trini@konsulko.com>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v2:
> - Added Tom Rini's Review tag.

This is not actually a change so should not appear in the log.

Also note 'patman status' can be used to automatically collect these.

>
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
