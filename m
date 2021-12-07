Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC65268
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Dec 2021 06:24:50 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id x15so52929974edv.1
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Dec 2021 22:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0KJMmvwISRDBNme5U40tfGPjn6GfK5RfovAqvyVQV0Y=;
        b=rw+G3kZwyYwP4OgpwwbbBJC8IshDMM3vkMw4UqdE+7kNHQb1YVkdGc8DPTcm+sptab
         jjL/0euM8Gq1FuWOkLMCmCixmQSggF0L9uaVITygGw8JemIRMrv6gL2+/Yrdz24PPUYS
         4kUvzVhxHDkP4mkyN6bSk+pUw4gvqBiQNs05k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0KJMmvwISRDBNme5U40tfGPjn6GfK5RfovAqvyVQV0Y=;
        b=lLm/2nvJ+ViNPqFSUoSugxC+E35Wq29MwM7CQBX1BtYKoBrP9HvOZ9COtbWa9rSGEa
         qX3cUc3PWhn0QnJ1i+U2OIK9qYP93UpL3VFw/4qG+K081JiErXXzXNLbi93LRFYwEPd6
         eH24xKfXa+9z96DLm5H0BtbFb4iVr9r5OoX3SrMEAPxBWOoLbIMg5wnXh3v8hZzcaHwv
         Ve5m26RnPoYuzh66vVt9pDDyBE7wzD9XqMEXJHWODNbk3sLi7POh0ltgYs+Z2wOLNLys
         os9RFRswg5fe71BxLfxBzSoy7q5rAf3JxPv452cNXgWBtEsGsXTaDZw6f+QnlOCYkVTv
         Tqxw==
X-Gm-Message-State: AOAM533Q/0nSx42T4V4qixoIR4czDZXBNO0jEH5aNvUfmnKgE4yqy5CB
	NaYy9zESnYToWmLGxOwDXhWnSdc3y+hO0yFZ8h4KLcEIONlqkOa2
X-Google-Smtp-Source: ABdhPJzEjR76BV69yZLcdFEOk2D/EYl1ICvW387A85mcXAp6jWByaIPEB3tq/5ydIt43OujPjrX+PvHX4PrABYB2Ocs=
X-Received: by 2002:aa7:c30e:: with SMTP id l14mr6019752edq.370.1638858288796;
 Mon, 06 Dec 2021 22:24:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210911173916.615928-1-jernej.skrabec@gmail.com>
In-Reply-To: <20210911173916.615928-1-jernej.skrabec@gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 7 Dec 2021 11:54:37 +0530
Message-ID: <CAMty3ZAfYZnsEs1YZkJ1U01XaPsEcFjeLsSHJ3Ph-EjsVJLbBQ@mail.gmail.com>
Subject: Re: [PATCH] sunxi: call fdt_fixup_ethernet again to set macaddr for
 more aliases
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: andre.przywara@arm.com, mripard@kernel.org, u-boot@lists.denx.de, 
	linux-sunxi@lists.linux.dev, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 11, 2021 at 11:09 PM Jernej Skrabec
<jernej.skrabec@gmail.com> wrote:
>
> From: Icenowy Zheng <icenowy@aosc.io>
>
> Sometimes some ethernet aliases do not exist in U-Boot DT but they
> exist in the DT used to boot the system (for example, modified via DT
> overlays). In this situation setup_environment is called again in
> ft_board_setup() to generate macaddr environment variable for them.
> However now the call to fdt_fixup_ethernet() is moved before the call
> of ft_board_setup().
>
> Call fdt_fixup_ethernet() again to add MAC addresses for the extra
> ethernet aliases.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> [updated commit message]
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>
> Hi all,
>
> this is effectively resend of:
> https://patchwork.ozlabs.org/project/uboot/patch/20171027093439.12414-1-icenowy@aosc.io/
>
> On at least one board, namely BananaPi M2 Zero, adding ethernet connector is
> pretty popular after market modification. Since this is not something that is
> already present on the board, ethernet node will never be part of upstream DT.
> Thus, the only sensible solution is to use DT overlay, which adds node to DT
> (maintaining patches is tedious). However, when overlays are used, U-Boot
> misses injecting MAC address, as described in commit message.
>
> Please reconsider this patch for inclusion in upstream.
>
> Best regards,
> Jernej
>
>  board/sunxi/board.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> index 1a46100e408d..97554d4642ed 100644
> --- a/board/sunxi/board.c
> +++ b/board/sunxi/board.c
> @@ -997,10 +997,12 @@ int ft_board_setup(void *blob, struct bd_info *bd)
>         int __maybe_unused r;
>
>         /*
> -        * Call setup_environment again in case the boot fdt has
> -        * ethernet aliases the u-boot copy does not have.
> +        * Call setup_environment and fdt_fixup_ethernet again
> +        * in case the boot fdt has ethernet aliases the u-boot
> +        * copy does not have.
>          */
>         setup_environment(blob);
> +       fdt_fixup_ethernet(blob);

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
