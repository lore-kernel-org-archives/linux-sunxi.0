Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E310BA927
	for <linux-sunxi@lists.linux.dev>; Tue, 30 May 2023 23:06:14 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-53487355877so3249585a12.1
        for <linux-sunxi@lists.linux.dev>; Tue, 30 May 2023 16:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685487974; x=1688079974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSt3Az2tny3eQlaVqB2zu16ttm63V7AZ7el7ka8wKXU=;
        b=X9z9+aQDWH74vRy4IFplfW22Zx5BEwKFKnlpZHyhVJxEScox69ft1HKu2FLKLcSrge
         Vd01P1Id4crkK4Hcd6tBX8pKrEOECwVQjb9ZktMnA4BEPLyas9jK1raP4sSjp79/Qxz0
         LeIwDXRtXCqgbmHoSHUaf6xq8WrxB3sDiqNBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685487974; x=1688079974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YSt3Az2tny3eQlaVqB2zu16ttm63V7AZ7el7ka8wKXU=;
        b=ha642OHPcJ+j1pen7AhGHeXgvXe0JWFOPM+Mte/vN0hvJnaRg7yk8tWdgV57bCKNnG
         1eIUM8Ho3mdERftSaGX2M7DePgDkr3vZsqAEszV8wwrOMW8hkpFj2Nh7w9yJgxDt0bpE
         YqZvMsgCwHpswPX8fcuNxEiGqMlYVGEOXK3P68Jk5anUtzEf+Ophf/RGsEnrEqB4jHn0
         U2Ktsp/WX1IS/o3lXc7SRtV410lxpk74vap8fl85MnxuX3UlzXAkZCd1ACYNVzJjdUig
         6tRumn8Td7oeWc1Z7zOH38uNkZmNBF3GJ0Kx8T+Xk5R8Shrb3FDjsfn1tEhSxRmSohkk
         tTwg==
X-Gm-Message-State: AC+VfDxaKj8ujAGMNpwwViKtDen412oHZGMNCqjeUWYV4Tz0Ytr6PGdN
	lUiD2mtfWwAsTFKDikDCJUXoRQ==
X-Google-Smtp-Source: ACHHUZ5RyXdOh/r8J51+MHLiWlyfvyIhJb8ljPwpidWRnHRRfPfGJtDpjXj925079sXa9tjNwK9UlA==
X-Received: by 2002:a17:903:2303:b0:1b0:7739:657a with SMTP id d3-20020a170903230300b001b07739657amr1763269plh.50.1685487974391;
        Tue, 30 May 2023 16:06:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t4-20020a170902b20400b001a6b2813c13sm10810243plr.172.2023.05.30.16.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 16:06:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: azeemshaikh38@gmail.com,
	mripard@kernel.org,
	wens@csie.org
Cc: Kees Cook <keescook@chromium.org>,
	linux-kernel@vger.kernel.org,
	jernej.skrabec@gmail.com,
	linux-sunxi@lists.linux.dev,
	linux-hardening@vger.kernel.org,
	daniel@ffwll.ch,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	airlied@gmail.com
Subject: Re: [PATCH] drm/sun4i: hdmi: Replace all non-returning strlcpy with strscpy
Date: Tue, 30 May 2023 16:06:05 -0700
Message-Id: <168548796308.1350188.7857893772168629136.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230522155331.2336966-1-azeemshaikh38@gmail.com>
References: <20230522155331.2336966-1-azeemshaikh38@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 22 May 2023 15:53:31 +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] drm/sun4i: hdmi: Replace all non-returning strlcpy with strscpy
      https://git.kernel.org/kees/c/6036094a9380

-- 
Kees Cook

