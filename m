Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7811546B5
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Jan 2023 18:37:43 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id r205so24060189oib.9
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Jan 2023 10:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bz6Srssb7KxtWIp2StQowmALBQ/ecYiEATmxxDpLUgE=;
        b=da/8FrC3su8n4920e9FOvu1j/TWeGMIAZK3QFppvkb8spsp70RYdvbMm2q6kr8fatp
         5ZhAWveL0+ghlV+yoW55uxO1VApqKx7SI3P9NQE44tN5xuWeO0ji9XuxwTvr/dlc9rsT
         tVUpF37v44gwmO7bLXKdtbiGDN/w5BQAj3xAbBkq52KC4lJdYL5HB8bnXAJ4+Its3plb
         v4Jme9uznTgidvg/tGOHCdyd7VszsqLeOpmjJn9xH6h/dQojHZTl8CSLKaqG/edls6PK
         yQ1U3V9Jp+1Ca32YYe1xYlqr5URZI2+ZvAQNN1kMuPpVWR6dfbhkvE0JUVZPCO257Kdu
         QMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bz6Srssb7KxtWIp2StQowmALBQ/ecYiEATmxxDpLUgE=;
        b=w5i1bfgyAK+vwA1yE+ItUXWTIbLWH0/nlFCZ5DX4GkUyn2JKkffIhjXQzvz0mnGapY
         ZbxK+7VYqZrdpnzqnsnrqAaoljD5pePYtIjehOKYyClblqvfvalsmBX3IcI+5q6bxCsV
         +9cV/6VyOxsTSCY9zf0rpbpFhgoJELRRbRoz1lQcGPQRPc33sSMl0FpM2U5VSnHhU3o7
         T29kdmfCBa8vQ3sguw2sGubR06c0Vc58+iABeaWk7grQyZnFA+y/tqZvkQkKTjoYS0Iq
         lx50zSjQ1gvTxBgyeazHEYDJxyP7nYw+qEAMR1XKlmrVDWbLwZlrpHMpXeCzCrnrxqiW
         Lw9w==
X-Gm-Message-State: AFqh2koaVvq6slEtHwUzuArXDYXcNiz5wRvVns08EPfy5Y7+/aTyP52C
	+Gx0xlx7SCUwK0HpBu/wROUEB5JdwkIrxCgGqtE=
X-Google-Smtp-Source: AMrXdXtOKveG9OHXqQHo9xNE/hNA9+TOjgR84/kFoTmzmkWJIw/wZWO6Z17PeC1Jr2qOmQVHIKAxEfu0US9MC60q0b0=
X-Received: by 2002:aca:2807:0:b0:35b:f5f7:3ed0 with SMTP id
 7-20020aca2807000000b0035bf5f73ed0mr17751oix.46.1673894262477; Mon, 16 Jan
 2023 10:37:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230116131235.18917-1-tzimmermann@suse.de> <87k01me9jn.fsf@intel.com>
In-Reply-To: <87k01me9jn.fsf@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Jan 2023 13:37:31 -0500
Message-ID: <CADnq5_PsL8N27_LC_h1m8i_FCg6mJtr7K9Yjv=guw-KGD2wU5w@mail.gmail.com>
Subject: Re: [PATCH 00/22] drm: Remove includes for drm_crtc_helper.h
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, sam@ravnborg.org, daniel@ffwll.ch, 
	airlied@gmail.com, linux-aspeed@lists.ozlabs.org, 
	nouveau@lists.freedesktop.org, linux-mips@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 16, 2023 at 11:20 AM Jani Nikula
<jani.nikula@linux.intel.com> wrote:
>
> On Mon, 16 Jan 2023, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > A lot of source files include drm_crtc_helper.h for its contained
> > include statements. This leads to excessive compile-time dependencies.
> >
> > Where possible, remove the include statements for drm_crtc_helper.h
> > and include the required source files directly. Also remove the
> > include statements from drm_crtc_helper.h itself, which doesn't need
> > most of them.
> >
> > I built this patchset on x86-64, aarch64 and arm. Hopefully I found
> > all include dependencies.
>
> I think this is the right direction and I support this. Personally I
> think it's enough to build test and fix any fallout afterwards.
>
> To that end, I did build test this myself with my config, and it was
> fine, though that probably doesn't add much coverage.
>
> FWIW,
>
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Agreed.  I applied 1/22 since it was an unrelated cleanup, but the
rest of the series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
>
> --
> Jani Nikula, Intel Open Source Graphics Center
