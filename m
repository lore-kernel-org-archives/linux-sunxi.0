Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF34440C
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Oct 2024 03:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729396771; cv=none; b=Z/+31BXvTi7ASlyyCq2cEMcJlxAd6gncExqhybubVb7+vikvsuNSgykehcAnPRgRMYpoKh2uuBVnL8Y8cLwSxO/86Fbr9y4vl4xfpog7NBQtisbI5UMRxHTvH6lt0OEpqtMm07oQ3kDxBzF72HkuWkAscsd6cKCEJKMswK1g9gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729396771; c=relaxed/simple;
	bh=vN/xU3v9rI3HBZYkabBsSUu0cq0zQyoVLOimRycrs7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSuEEPHu+lWHFU7iPLcp63kuhIQpp7n0LYAiW5QZJnAax5mUW6/J2/UoGyfhDh9prOPbhV+jLqF4ijcy77idwKCMKErwIZN4xLofr8+IoHv4Ss2ocOI6Ler9CHSaODvRCEDHaSibZ06qMU62/CXn2S/7vRst3J5LQDyD5CDviMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqIkNAHM; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqIkNAHM"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso2177439b3a.3
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Oct 2024 20:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729396768; x=1730001568; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AoRk7upsfv9NWt7MBCmfOuNRDL4bBF9fcV9bVsrVk/0=;
        b=VqIkNAHMc38XoRUc1f4YKR1hrn39gFnbmk0ujq9LCGhZqjFAsYiM2Yw12eXBw/AAuf
         jGiAk0I+LAlYNME7sb20ZzGW58g7XzZ32quAF7vS5n+W2+Xt3D1pOBsm7aDTJqbOpYDh
         wWz7kUU8Jrw7BYDXDdp3vI9GmUU1fnuEkVpGhJ7WJTdbkH18Nz1yb2VF4ywTS51T9zlL
         2iaXnmPH/ac/4zDLH2Deo1lpdib1RrFEee7jcbSD9THUXENP2d+EjVAYyvZm7aiRuhim
         N50msnm76cjp6Yt6Useje/T00JEDiJTy25dIPpTp9IcjyUw54RRprcNzJuKR7AYgjaNx
         e+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729396768; x=1730001568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoRk7upsfv9NWt7MBCmfOuNRDL4bBF9fcV9bVsrVk/0=;
        b=W5W+CXAnUQjbgirz7ssmgh/HEwkE8GqNdqnSi/ECY58gwjl+/0UVGeQtyAfeQKGKu9
         ppmhyGUOUdkfWcCkEisGRre13j2utp9PI7nHgnn3bO6z9BCPIh+VxkzVdmacWn5+bjxw
         /+uHbdlhIPROqk2z0D7h0pRjRxc30ON6XwB+J8Oe7gvJtRxZrxMQ+cg5oZUekytvm7If
         PaYNJowj0v+jjCkBxL5SZYjZWdTKzhso8rhExtQAsCnNcLjcVP5d1UFnKddFjEvpamxh
         ArcAsGpz1Hft+yZXA0qRIL+HvzzpZEXYe0kZI+n9HNugoT+5/P160w32GfQIY4yd3gsP
         a59Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDSwN4eJ6xJ11lwuk+czJP6cXyjOC9rLLCQhwvehcx+BWmIosAkTxsAxgurxh3DAGg0uCpxlEiDY4G+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuwZu58kNIk8E3ZH+5IX6nFbUYi4QF48C7u8G3q8Li+LnnkG7j
	u/9D2V5Bls27+dQNVQ0/8+QJf6FtZncEIwVWzBVJ1gyxQ2PLzVQk
X-Google-Smtp-Source: AGHT+IEauN6DVG29XwxoUu8C/NrTja4DP2UcbOXGEqzr1/C/B8/WXeDTqF9qwFarcPA6JhNmwEv9Ag==
X-Received: by 2002:a05:6a00:9298:b0:71e:5de:ad6d with SMTP id d2e1a72fcca58-71ea323b91dmr10395281b3a.24.1729396768251;
        Sat, 19 Oct 2024 20:59:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1415bd5sm468654b3a.187.2024.10.19.20.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 20:59:27 -0700 (PDT)
Date: Sat, 19 Oct 2024 20:59:24 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 01/10] Input: cap11xx - switch to
 for_each_child_of_node_scoped
Message-ID: <ZxSAHGCAg-cDMo5D@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-1-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-1-ebc62138fbf8@gmail.com>

On Thu, Oct 10, 2024 at 11:25:51PM +0200, Javier Carrasco wrote:
> Use the scoped variant of the macro to simplify the code and error
> handling. This makes the error handling more robust by ensuring that
> the child node is always freed.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry
