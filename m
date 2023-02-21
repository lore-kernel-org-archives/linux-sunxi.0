Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015118492
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Feb 2023 18:24:31 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id cy6so15426771edb.5
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Feb 2023 10:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XicgGxxpxnjWOAupqddiOjOjwVHxq+BPEsx44HPQNeA=;
        b=QTWnOKsaUPUp0dN+ok26p/p57wnxvJ9zQNA6WvOCq+B/Uapg2fsAXqfhwhl7w3rLke
         rRrjl5DSzfrxFyW17QzrpY76Zu8pfQmHuMNkIvA8D646a44f/0fxPAlFZ8Iott9td/W0
         z9mTNzn3g2QsUvMJKgAxhanOriMDvvbQojevqwKFjC/OI2XzqMdu4OKwRzwi6uskvdBT
         h8sYPbKs4yAwPO2lMlWajxaw87LYxJYlHMSJ41nMDLCMNSYziBpaDc4pA5/CXPLdCbRv
         fxQ+uRGTlPVKiW3hs8F7GAwcFK0cbOvR/KFCoWFpPLooZdfwgNPJTa++FKuva+RJnaHX
         bunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XicgGxxpxnjWOAupqddiOjOjwVHxq+BPEsx44HPQNeA=;
        b=Vh9MDOnBEzibsM+tMCitzrgJ++GR+9itjz1vG1koK1NREm/C+wg6yDkp9aH0bveeJc
         4dyfZ7UTTfULL8zww2WuZBPxmD8/JWjQfKCFbMyD7nmRihsQlc3QCJ/lwTcP1BfN9hrZ
         PRRFvjXNQQ3zIBC4qUas08+/XVSYjlR/Cktfoz2q4pwYIa1r192UmrAypdx+EgbgIlEB
         lHVcAs7/xVzbjkv9Hd33vQg7GqoC8T5h9/peVMemVyEHSgKM6mVGT9jE3NHqrCuR+SoS
         xQW3U5WABRtZnhQlIjGkgbEsUyO5pINttuLbh5hYhp2ersTuZ46Owz0kgabxm2iIGrwx
         E3dQ==
X-Gm-Message-State: AO0yUKU2MOAoce9gVWYttFMHbRNgB6Kvu1Bj3QqMyhVfkyMkwz0m9Ek0
	ax1paB4wA7rgB3FMnrI96Zk=
X-Google-Smtp-Source: AK7set9eFaA2C9JxaxHcQzx5t2aKoqYrMobeqSCJao7DFH76N6d16pI6tn+/FVWlT/bRyhwL+KxCKw==
X-Received: by 2002:a17:907:1dd9:b0:89e:8c3d:bb87 with SMTP id og25-20020a1709071dd900b0089e8c3dbb87mr14788646ejc.71.1677003870083;
        Tue, 21 Feb 2023 10:24:30 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id kw24-20020a170907771800b008cd1f773754sm3500642ejc.5.2023.02.21.10.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:24:29 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mcgrof@kernel.org, Nick Alcock <nick.alcock@oracle.com>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 12/24] kbuild,
 soc: sunxi: sram: remove MODULE_LICENSE in non-modules
Date: Tue, 21 Feb 2023 19:24:28 +0100
Message-ID: <4779930.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20230217141059.392471-13-nick.alcock@oracle.com>
References:
 <20230217141059.392471-1-nick.alcock@oracle.com>
 <20230217141059.392471-13-nick.alcock@oracle.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 17. februar 2023 ob 15:10:47 CET je Nick Alcock napisal(a):
> Since commit 8b41fc4454e ("kbuild: create modules.builtin without
> Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
> are used to identify modules. As a consequence, uses of the macro
> in non-modules will cause modprobe to misidentify their containing
> object file as a module when it is not (false positives), and modprobe
> might succeed rather than failing with a suitable error message.
> 
> So remove it in the files in this commit, none of which can be built as
> modules.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: linux-modules@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej




