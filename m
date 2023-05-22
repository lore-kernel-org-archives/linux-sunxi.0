Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15956174C0
	for <linux-sunxi@lists.linux.dev>; Mon, 22 May 2023 20:16:18 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-53063897412so5859417a12.0
        for <linux-sunxi@lists.linux.dev>; Mon, 22 May 2023 13:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684786577; x=1687378577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IXAgSSaBSjm1CetJruAB7G9vGtE1c+hHoYZB1utEDWk=;
        b=QQTUxhTD+GBKEguQUQDkEE7nMOAe18rTZR4yd2iaOBBDSLRz7YTvTiKzOUoz/KfNRX
         53a/09Vvla3KWcqtTiP3yI89difUnrz+iE00qjLf6kPKp7r7w0Bkpvbvvp7WqhswLcI5
         P7LmB9YrcotM+OM13H5iyJWT/jIaabCUXsyr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684786577; x=1687378577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXAgSSaBSjm1CetJruAB7G9vGtE1c+hHoYZB1utEDWk=;
        b=jEYMbbJL+0unEIHq1Iis/hHSqc7zC6lCQObLnY5tr8S/la+7X5zwYLWd+oPsSTFg0Q
         LF0qMsW86Ww041SFLxcVjrzqIdGwb4lMSXVYFDImTxgsgnG0i8KDT+8CfESQwlSUHVPV
         Ck6Wgd250aDxqPkOeM2uhRibqL506xQE2mQGTgWMsT5Vr/nTBw0O+uWQYR3bV9yu8Y5p
         2wBHmAAlbzmIXe7oUDiigQMtw5f4FTncmTi6j7SBW5JiEa6zHk+c0gD/F3jSQOQwlVnb
         EuiJ2x0O/gQmRNlofExWa5RdpjRq+1DyXVIhINEox1zo+Bmnaz7JxbxwikaJM0Mud2lF
         k6Qw==
X-Gm-Message-State: AC+VfDx/prUJ1xZTReRNv1o5M6Cw021cDN+p9jSI167XEQ+t5O38b6jl
	PBUlhjF2+3EM1Vw6K/oMFyeLuw==
X-Google-Smtp-Source: ACHHUZ51FT7XO9iVtfE7W8pRe2pp+oF+jrhOC7+wSnz9QKew8znPQk021RvlTVHrkhez485O6aBqLg==
X-Received: by 2002:a17:90a:a611:b0:253:2dc5:4e12 with SMTP id c17-20020a17090aa61100b002532dc54e12mr10854532pjq.46.1684786577531;
        Mon, 22 May 2023 13:16:17 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id fa12-20020a17090af0cc00b0024de3dff70esm4445821pjb.56.2023.05.22.13.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 13:16:17 -0700 (PDT)
Date: Mon, 22 May 2023 13:16:16 -0700
From: Kees Cook <keescook@chromium.org>
To: Azeem Shaikh <azeemshaikh38@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] drm/sun4i: hdmi: Replace all non-returning strlcpy with
 strscpy
Message-ID: <202305221316.FE9BC18975@keescook>
References: <20230522155331.2336966-1-azeemshaikh38@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522155331.2336966-1-azeemshaikh38@gmail.com>

On Mon, May 22, 2023 at 03:53:31PM +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> [2] https://github.com/KSPP/linux/issues/89
> 
> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
