Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1BA10EC
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 07:37:26 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id n126-20020a1c2784000000b0038e8af3e788so7888776wmn.1
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 00:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+xQY2SpAJG2FH0txc34PYfRaRk4uWtpVwc78xUBOWSU=;
        b=TS/IxOnvcH6ZPV1/3rEi3H3oQt9or3TRdg5EVUzLyPTjuly+DjvvsaK9DyiWWOYF6E
         V3jWXpD9hkg3SlZz3m8JADhNws0wD+RW0PrWA/y74T5744uSQcfZE1quEVbWHoR7Swg5
         Kwn8aZWuW55Rttcz2Nb0hm/VT2kil5/NL6OiTNv+MA9uwh3UjJrcKJxR74tLqQj+6rQI
         OSx2faf1xSTTLwqzhUqc/2hniLWXqMWZ9k7B86D+bOeTYF9nMvRhc9MCidIai9pOYzxp
         Q9PkgwNPGF77XlZg1bbTaeagNLSFQOhzRUPEoUwMlEGWLgHVKWZUeNBrNLtzQG0KUpVy
         NUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+xQY2SpAJG2FH0txc34PYfRaRk4uWtpVwc78xUBOWSU=;
        b=IowTXYHtAv9daQ/IHY65q2JSDe+UytDEwMW8smNliZeht/Jw4fNJK5HwNn5hJOSeyb
         ZGD1/KJnTQA1Fm5sjjC/JDgJlIMD0+qdJzT5G9xBSfO3xsXIHq7t6iSbQIftmBCpKGjj
         kCdzuHkRPe2Ml7kARQEptBml3WMo1apfEEvAQ75fc6kPi3UrdsWsmhFdgNTxVxTZhkI1
         JuFNPAKbR1RLtO7MGD8zH7zGmjjwPILrTbyD6LmAfLWL1EPZU9AnDoCcz7AhgmJw0+6T
         HPXGmAmfCV7V8eJXvqhoX9ksUb6JDrq6WDqz2KW/VkbvMTMnzgVd1oh52+Meyw94PYXU
         jDKA==
X-Gm-Message-State: AOAM531+3A/udn0A3bWELdWoSdlCFSj8Rt6XujeHZNl1jcapQhjamwNn
	gwN9wXsP7fKtbUgE2rI1Rr+ReQ==
X-Google-Smtp-Source: ABdhPJw6YDsVxhm8ahPT5MtcNsZmYpcdioU9tctYlMVQ0DSOz1HcAz/qdpUjYszLpoIjX1Pcu6pNMQ==
X-Received: by 2002:a05:600c:3c8c:b0:38e:4c59:6852 with SMTP id bg12-20020a05600c3c8c00b0038e4c596852mr27607010wmb.194.1649662644891;
        Mon, 11 Apr 2022 00:37:24 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id k6-20020a05600c1c8600b0038e7e07f476sm21404842wms.35.2022.04.11.00.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 00:37:24 -0700 (PDT)
Date: Mon, 11 Apr 2022 09:37:22 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: jernej.skrabec@gmail.com, samuel@sholland.org, wens@csie.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 00/19] crypto: allwinner: lots of fixes
Message-ID: <YlPasmjElADX+7u5@Red>
References: <20220317205605.3924836-1-clabbe@baylibre.com>
 <Yk/xNIjjINj9Hvki@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yk/xNIjjINj9Hvki@gondor.apana.org.au>

Le Fri, Apr 08, 2022 at 04:24:20PM +0800, Herbert Xu a écrit :
> Corentin Labbe <clabbe@baylibre.com> wrote:
> > Hello
> > 
> > This series is all fixes which I found on allwinner crypto drivers.
> 
> This doesn't compile cleanly with sparse.  Please fix and resubmit.
> 
> Thanks,

Hello

Coul you give me more details ?
I do not have any sparse error.

Regards
