Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA723C04
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Mar 2023 18:48:00 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id j24so12750358wrd.0
        for <linux-sunxi@lists.linux.dev>; Thu, 23 Mar 2023 11:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679597279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8FWNgQNPCC7D7xKGDpYpPeNQgBYQlnN/7rIkoHcrFk=;
        b=A3qhSSsUsD/lcphIMCN1rqn4spmYLqxOG8pKshDIEoxr8HVR/L+UzpNq5BOfMPIJlD
         B+5wR6AvIR2CuZIdGd/WKGkkXAscp6/88OntRjifaYmyNwSrb4gfjIYsp+wGqgcGbAig
         84j2hnha0Zr1scEZymEwQ5hztC7yaglGYdoV9scQ6HZJIQ2ZYWgrMoY4kXQax7P3S7BW
         a+jaAvwmRJDo6prhIBJYdpSCGEHUoS47IG7mjmzGoIX5t9YZ8nyk0FgpgVT/rcdZN7XR
         ssXBToTblWo9v1ALX+5Q685638iWGa+KYZf3azI0kGvK/Te7brV4PRbCVlHDE3R15THq
         +wxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679597279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8FWNgQNPCC7D7xKGDpYpPeNQgBYQlnN/7rIkoHcrFk=;
        b=4AA5CkIHmmRo71I6GX0FwUPZ4X7qeXD4/tGnH1rPzs05HfSBRiVRNxNJ4VRWg1tQpF
         ZW+EJzI2ZH7G93LRnB/Hwq3LN3QgzKx9rRCyAoM9eKSWtIIKpG/cfI38J8LifydUvNG7
         YUdMNRhO12waPKlUmy7fjI0kOHRZIFnr3kZsT53ie8WcFhZIDf8YP3lpDiAHHCwu/ztL
         pfKY/syElXb3tZ/iKiaPToPT3kOhRBddq1E56ql4UxoSW6MpXNDBpIhN7SiZA1BVGVRA
         SHRAXp018CKLOkENhLSpmzwFD2TBB+UcAFnuZKYzcEp1pAUmS2vaHj7onzNsP90ZaEng
         zPOg==
X-Gm-Message-State: AAQBX9cBdgwpAVtNebjZrP7SpXFgigmCRMaoU/rlOr3myZd9DyiNaKg4
	jxwFnBh9TVIQQ7+zMbLBKQI=
X-Google-Smtp-Source: AKy350aBvrFH/pBwHenW0d3ikefW7j6jxF4RZSJ9EpFvZkGt37FYUa2OgZABIV5NDF983nCS4QRhbQ==
X-Received: by 2002:a5d:6389:0:b0:2cf:e058:3ccc with SMTP id p9-20020a5d6389000000b002cfe0583cccmr119559wru.66.1679597278568;
        Thu, 23 Mar 2023 11:47:58 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id p5-20020adfce05000000b002d64fcb362dsm11489891wrn.111.2023.03.23.11.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 11:47:57 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: vkoul@kernel.org, ye.xingchen@zte.com.cn
Cc: kishon@kernel.org, wens@csie.org, samuel@sholland.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: allwinner: Use dev_err_probe()
Date: Thu, 23 Mar 2023 19:47:56 +0100
Message-ID: <2672110.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <202303231542125412125@zte.com.cn>
References: <202303231542125412125@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 23. marec 2023 ob 08:42:12 CET je ye.xingchen@zte.com.cn=
=20
napisal(a):
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
>=20
> Replace the open-code with dev_err_probe() to simplify the code.
>=20
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


