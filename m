Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2397F14ABB
	for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 18:54:51 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-50b383222f7so11418027a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 11:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683744889; x=1686336889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tpps0vuMSlTbVQSBZ3c03u7OEs5zj2+Xyh6XKEwYQRk=;
        b=T9SSHxghDSA53XZUgiO0MzcDudpZJHg7tVnkzMeB7cDUoCg5Frs9+NwvhbF/9kkoLC
         klfiu6RIv31S57mDxkeGjsZaZ35N5PjMJ5cPsCAVyHQtgYFzPtjuIW5TDy+OIfiUbe8w
         4/nMjgBAz/FglLT+02TUMv/Eifaw4d0EynnRH+MjOrK3ZQmVbj+FNscUd8dZaQWrkEdH
         BN21P7TgTmgPMk/WtxQexmnrCEdV6h7kqz8EUDrrxc3tGUTzOzVHpuAMK1wd4EgOeBxd
         zX/BgydfsqeCOkarw56CooCg0Ix8QbsWi0kqokBo4eZvppj/QjcggYPgmpCHggCqaRjn
         Sg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683744889; x=1686336889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tpps0vuMSlTbVQSBZ3c03u7OEs5zj2+Xyh6XKEwYQRk=;
        b=Y04V7S/3GGA5doylbvySiEdi7djKQ5jNlRiRHhmKShVGF4s5jcbFeOOAKEPuq41q9G
         wlzhJb2rAErjck5elsmYGJMrJ4rcIXXLPfEmsgl90ZQMgt+3K6nwB1f8d740fU+MCpR1
         Su/JuP9F3HxqPxHNSJMaHERiOWKGHl9+z4XgFUG0wrQBXRf50EzZDJkVpKf5+DRBxp19
         6NsUMyhHXoJUHfSxwHQUkerb4Qq6JyL+6+quJu/SsMTMYRHYT/o42cWP93X2UU8H36Lp
         r++Oii/SW3z6MmPm+QGxzBDgkEKFeri5AwJoLiH0h4qbVVr4nz/6pdQ2Wn+/Fu8RceCi
         B1/w==
X-Gm-Message-State: AC+VfDzF7ffYQe20J1gDT/1CDzfmhbIVfy5pVBro8LXlppcbpLxTof36
	4oOvku4sZkK9txGEWLkcXP0=
X-Google-Smtp-Source: ACHHUZ4NAD8Wr3jSfg4mRi6MrmEydNrcDgkDp7wpSSCh2F4XtqVw74F5RsRQ5mvzdo/DOMGiZh3FAQ==
X-Received: by 2002:aa7:cd76:0:b0:50b:c5b0:4de6 with SMTP id ca22-20020aa7cd76000000b0050bc5b04de6mr13966850edb.9.1683744889194;
        Wed, 10 May 2023 11:54:49 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id y15-20020a50e60f000000b0050bc27a4967sm2160813edm.21.2023.05.10.11.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 11:54:48 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: samuel@sholland.org, wens@csie.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, andre.przywara@arm.com,
 Ludwig Kormann <ludwig.kormann@ict42.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:
 Re: [PATCH v4 1/2] dt-bindings: arm: sunxi: add ICnova A20 ADB4006 binding
Date: Wed, 10 May 2023 20:54:41 +0200
Message-ID: <2284225.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20230510111528.2155582-2-ludwig.kormann@ict42.de>
References:
 <20230510111528.2155582-1-ludwig.kormann@ict42.de>
 <20230510111528.2155582-2-ludwig.kormann@ict42.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 10. maj 2023 ob 13:15:27 CEST je Ludwig Kormann napisal(a):
> Document board compatible names for In-Circuit ICnova A20 ADB4006
> development board.
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Ludwig Kormann <ludwig.kormann@ict42.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


