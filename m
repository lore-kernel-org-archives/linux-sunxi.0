Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D170B5F
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Mar 2021 18:31:13 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id d20so36298794qkc.2
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Mar 2021 11:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=SAH9zmKUk3csGOJcaxSXyP54gFvmy2kUmaab3Vw4S6E=;
        b=RVR6r4rJ9iVO+QxQPrZ8LrU4qk09d24piqqv6Xz+GjgcixPbr9P9WhBz2x8GO03VOz
         w6i6Wr9Mi4YdAhsW7xVL2IZsewcbzS+MoJXicIw58jMYDopycrP94C6RiarwjclnAKGq
         gZPizg4z0aPHLMtDcCJTpS3ztrsthdwVCr/pY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=SAH9zmKUk3csGOJcaxSXyP54gFvmy2kUmaab3Vw4S6E=;
        b=BgcD2PTvEH52WQoa3DzP//xkZW9Lf8QG2M7nO5qiteqMgbgMollHqTsCly+vywrChD
         RQYPxUOOQdCm9wn+QnNeduKHOvaX8CPPocCEF9HjhzhX3fhRrnQgy418IGICZbQuOfwz
         heh72aD0pQ4fVHn9XYUojp6dZSyWrjIO6CuTB+XrKUDUgq6TnidmYMssAAmZBnMRQ29h
         qaN5bYIWooYfxMwzohPVIBHaIPFMnCPaY+s+97XtHHutm975LxrSuMkLz/gFlYb480ph
         2iN2MykJng7k83l7rQf7FpWjU9LItKE7K+9w0/UzXq/BKst7zEvg5365fzIlDytqjAV4
         WYOg==
X-Gm-Message-State: AOAM533r+Ml+L8Iy3lwkTJPFJkNjo3pI+oHQ8HOuc8iMWfU2CA8uuIkI
	niv4ptH33e/FbbahLcET8moacBmlWNSaxLMd9Vc=
X-Google-Smtp-Source: ABdhPJxt7em4uiM4lmbdzluV0zwI4UIYBK8kInS/Ygs9gCcOAgguGHpenyqwuUs+pP/S1HdNF50Wbg==
X-Received: by 2002:a05:620a:144a:: with SMTP id i10mr362696qkl.431.1615919472524;
        Tue, 16 Mar 2021 11:31:12 -0700 (PDT)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id y13sm13306354qto.39.2021.03.16.11.31.12
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 11:31:12 -0700 (PDT)
Date: Tue, 16 Mar 2021 14:31:10 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-sunxi@lists.linux.dev
Subject: Initial message
Message-ID: <20210316183110.kpeir5hs2fu5dhiv@chatter.i7.local>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Initial message to start the archive, ignore.

-K
