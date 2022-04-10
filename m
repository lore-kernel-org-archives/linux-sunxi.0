Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0815E137A
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Apr 2022 18:23:19 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id bg10so26734261ejb.4
        for <linux-sunxi@lists.linux.dev>; Sun, 10 Apr 2022 11:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dTlWD/+DNG8ntKC7giRASd1M2RQMGgWr/+DdcAwn+Oo=;
        b=fTMuFY8NJsqQxEy1jImsyfghQ41FlphmGwdVAypDvJrGJG2TOyyBp3sU9/lk4Kc9Wa
         xFgHQAGmcPPsFV6W11Q81eQ4wpQPF1dLb4D7RQmZjOYkAruuMeO3XDoWUxqp+nEuJvQh
         KMz/x6PEMXjlOF+/ZlB5sDl+tvPVvflC8yZfWH0bqxAAKfGY94w8ltirJIz+QbcF2VJU
         E+7Vxuws97vPnDn+UXE2RsRm4PGBAThfQ/b4xbSqTnw20vKKn83Le92BW5Xm9jX5QB5g
         kN+66pwcJb2dlKsTN5NrTRH51kqBUenTm8K/8CmiCeY7tOZ4WQnqgF0/P3Ohs8c9i/3x
         +9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dTlWD/+DNG8ntKC7giRASd1M2RQMGgWr/+DdcAwn+Oo=;
        b=Q8jgZ15nxc0Vt+B/bgLecCsf3pIY7Q+at0zth9wRbbTwkGZlT9YIeOg8lexedi2/Uu
         lM5PnlnW/LCO2WmmqzsEn9FVcHr15uv3kAiE9JCSkShMPrebbvgc9lsM72XHz6ESZjmM
         DytQVRogsRQ8dbbSCuuK1a4amgWTEOABXBDiVUj0jyy5JmLt5mMayIlqWbMqzJfn5OBY
         F6evBUdmfadgExdQ74lB/jlucGk3j3bwYU0GOpLyYcixrt6mgjmKx/KIcYqelhaChDA6
         al5o5WtGJN19FNWJrpTL2ETvO9lHROUSp9LU7tKLQqNgKJsF04pmDwYi4fnz237WcQtR
         D5Ng==
X-Gm-Message-State: AOAM531yFrNxgInVIO6k6Oggv6zDrZS6vr7ZUXofCmEgovvIVWE19lFH
	lINm5UZoaKitLr5rYTg+55U=
X-Google-Smtp-Source: ABdhPJyWiHyfZYk23/sjFDvNph0NWHcmJxJcH7zcPzkJBZmYJp2g9edrzfKJENEPKt00hjEItaEJIw==
X-Received: by 2002:a17:906:9743:b0:6d8:632a:a42d with SMTP id o3-20020a170906974300b006d8632aa42dmr27490055ejy.157.1649614998151;
        Sun, 10 Apr 2022 11:23:18 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id e22-20020a170906505600b006da7d71f25csm11054135ejk.41.2022.04.10.11.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 11:23:17 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Philip Rinn <rinni@inventati.org>, wens@csie.org, Samuel Holland <samuel@sholland.org>
Cc: robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v4] arm64: dts: allwinner: a64: olinuxino: Enable audio
Date: Sun, 10 Apr 2022 20:23:16 +0200
Message-ID: <4727823.31r3eYUQgx@kista>
In-Reply-To: <40976a35-2241-a2f0-c9be-dd32c1b51814@sholland.org>
References: <4fc41278-c46c-6486-a336-f2a329bd6bd0@sholland.org> <20220407155145.10891-1-rinni@inventati.org> <40976a35-2241-a2f0-c9be-dd32c1b51814@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 08. april 2022 ob 00:06:01 CEST je Samuel Holland napisal(a):
> On 4/7/22 10:51 AM, Philip Rinn wrote:
> > Enable the audio hardware on the Olimex A64-OLinuXino board family.
> > Tested on the A64-OLinuXino-2Ge8G-IND variant.
> > 
> > Signed-off-by: Philip Rinn <rinni@inventati.org>
> 
> Acked-by: Samuel Holland <samuel@sholland.org>

Applied to sunxi/dt-for-5.19. Thanks!

Best regards,
Jernej


