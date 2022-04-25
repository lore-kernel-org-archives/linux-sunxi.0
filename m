Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BD77A
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Apr 2022 03:42:25 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id r83so12348555pgr.2
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Apr 2022 20:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zxBn91rD5NsN+ULE3f1MzjrrPmMEdVQzDsirY+3w7kk=;
        b=Bv9YRe2DobLRH6V6NLIkIwohK0wEB3NgdyeGivI3/PHxuApWmwSkIL1JObFqchi+Q9
         laLBACYhpjl6Dqi49ln4/AxWiRbhgSnWkRXI74FG+NaCDIDKixJOaPRrCpaTf0fvqHMs
         ciQx/AnGHixBP96lSfl1Nb47N9YpF9iaQQB575vVQtZdCa0PhvOKGfB6lETHLv1Ru9cw
         ejgow6Vf6BkvTHJD3SpjtQVh0tN82elMHdycYBi2wUz/Zqzlyc6qRutfuIkP/PKafruu
         g5T9GlyiRYLKAbVZCGtE0RoAxzl42amqJq7WscEY7G2BpVFJD6IiBcGv+c8QE0zr9IE0
         +/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zxBn91rD5NsN+ULE3f1MzjrrPmMEdVQzDsirY+3w7kk=;
        b=MrWykS2wP0EEkz6zuADiuRUz0gqJJ0P605Pa/Sdc8bmiK0a6PoVaAo3X6Ab4/ZJKY8
         Cx/IljAZmPjUWuWdpyYQc8/4KW27pbq7hf6OseE4rM16hIBly1ttNi7eAN9BW37pVnqB
         ST2eK1ScL5XEj2YV14vD0SESS+zyj4jTHD9n7GZrWYh/sQfP9Otdz449V5YwVm71Rfj1
         +R8b3aWUYR+TjJD1M9SAxlsA6cGL40Gz0UmdUaocTeWpdIIl3pLxMJQ7heoqCqhg1oPF
         adNmkMaSrYBJqf0OfaUJg0IkuFSvcDtC095sfSjyvQthOkWugFm8ttyYrlF+wuYfOX4e
         fQzg==
X-Gm-Message-State: AOAM531BzTEYyRdLeRLHOa/jNwngege22ckb4jYeeQYq8woryYyzYYAq
	rhjjMxtpF/6DffL5CJUg7I8=
X-Google-Smtp-Source: ABdhPJxKAcyR3oTaEZRQCMKouRShYJNrjazsPLwZeuJxY32fcoS3VNvik5Wi3eUWkWzEVUckR4G8Lw==
X-Received: by 2002:a65:6946:0:b0:39d:a0c3:71f with SMTP id w6-20020a656946000000b0039da0c3071fmr13344951pgq.160.1650858144813;
        Sun, 24 Apr 2022 20:42:24 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:282a:d50e:e0fc:c145])
        by smtp.gmail.com with ESMTPSA id i1-20020a17090a650100b001cd8e9ea22asm13013984pjj.52.2022.04.24.20.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 20:42:23 -0700 (PDT)
Date: Sun, 24 Apr 2022 20:42:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime@cerno.tech>,
	Rob Herring <robh@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 2/3] Input: sun4i-lradc-keys: Add optional clock/reset
 support
Message-ID: <YmYYnOgLhbB2CdrN@google.com>
References: <20220414002349.24332-1-samuel@sholland.org>
 <20220414002349.24332-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414002349.24332-2-samuel@sholland.org>

On Wed, Apr 13, 2022 at 07:23:47PM -0500, Samuel Holland wrote:
> Until the R329, the LRADC hardware was always active. Now it requires
> enabling a clock gate and deasserting a reset line. Add support for this
> variant of the hardware.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied, thank you.

-- 
Dmitry
